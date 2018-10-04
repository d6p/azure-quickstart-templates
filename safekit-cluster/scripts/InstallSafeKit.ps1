param(
    [string] $SkFile,
	[string] $Passwd
)


$targetDir = ".."

function Log {
	param(
		[string] $m
	)

	$Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
	Add-Content ./installsk.log "$stamp [InstallSafeKit.ps1] $m" 
}

Log $vmlist 
Log $modname
	
if( ! (Test-Path -Path "/safekit" )) {

if( ! (Test-Path -Path "$targetDir/$skFile" )){

   Log "Download $SkFile failed. Check calling template fileUris property."
   exit -1
}

Log "Installing ..."
$arglist = @(
    "/i",
    "$targetDir\$SkFile",
    "/qn",
    "/l*vx",
    "$targetDir\loginst.txt",
    "DODESKTOP='0'"
)

Start-Process msiexec.exe -ArgumentList $arglist -Wait
Log "Install Azure RM"

if(Test-Path -Path "./installAzureRm.ps1") {
	& ./installAzureRm.ps1
}

Log "Applying firewall rules"
& \safekit\private\bin\firewallcfg.cmd add

Log "Starting CA helper service"
$cwd = Get-Location
try{
	cd /safekit/web/bin
	& ./startcaserv.cmd "$Passwd"
}finally{
	set-location $cwd
}	

}
else{
	Log "safekit already installed"
}
Log "end of script"



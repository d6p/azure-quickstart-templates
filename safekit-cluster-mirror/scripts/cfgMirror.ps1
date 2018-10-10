param(
	[string] $safekitcmd
	[string] $safekitmod
	[string] $modname
)

$targetDir = "."

function Log {
	param(
		[string] $m
	)

	$Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
	Add-Content ./installsk.log "$stamp $m" 
}

Log $safekitcmd 
Log $modname

if ($modname){

	$ucfg = [Xml] (Get-Content "$safekitmod/$modname/conf/userconfig.xml")
	$ucfg.safe.service.heart.heartbeat.name="default"


	$ucfg.Save("$safekitmod/$modname/conf/userconfig.xml")
	Log "$ucfg.OuterXml"
	

	$res = & $safekitcmd -H "*" -E $modname
	Log "$modname => $res"
}

Log "end of script"



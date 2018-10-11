param(
	[string] $safekitcmd,
	[string] $safekitmod,
	[string] $MName
)



function Log {
	param(
		[string] $m
	)

	$Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
	Add-Content ./installsk.log "$stamp $m" 
}

Log $safekitcmd 
Log $MName

if ($MName){

	$ucfg = [Xml] (Get-Content "$safekitmod/$modname/conf/userconfig.xml")
	$ucfg.safe.service.heart.heartbeat.name="default"


	$ucfg.Save("$safekitmod/$modname/conf/userconfig.xml")
	Log "$ucfg.OuterXml"
	

	$res = & $safekitcmd -H "*" -E $MName
	Log "$modname => $res"
	& $safekitcmd prim -m $modname
	& $safekitcmd -H "*" start -m $MName
}

Log "end of script"



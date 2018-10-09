param(
	[string]$safekitcmd,
	[string]$MName,
	[string]$modulepkg,
	[string]$modulecfgscript
)

if( $modulepkg ){
    $module = $modulepkg.Split(',') 
}
else{
    $module = [array] (ls "*.safe")
}

if($module.Length){ 
	$module[0] | %{
        if($_){
			if($MName -and ($($MName.Length) -gt 0)) {
				$modulename=$MName
			}else{
				$modulename = $($_.name.Replace(".safe",""))
			}
            
            & $safekitcmd module install -m $modulename $_
			if($modulecfgscript -and (Test-Path  "./$modulecfgscript")){
				& ./$modulecfgscript
			}
            & $safekitcmd -H "*" -E $modulename
        }
	}
} 
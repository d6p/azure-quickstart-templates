param(
	[string]$safekitcmd,
	[string]$MName
)

$module = [array] (ls "*.safe")
$idx=1
$module | %{
        if($_){
			if($MName -and (length($MName) -gt 0)) {
				if($idx -eq 1){
					$modulename=$MName
				}
				else{
					$modulename="$MName$idx"
				}
				$idx = $idx + 1
				
			}else{
				$modulename = $($_.name.Replace(".safe",""))
			}
            
            & $safekitcmd module install -m $modulename $_
            & $safekitcmd -H "*" -E $modulename
        } 
} 
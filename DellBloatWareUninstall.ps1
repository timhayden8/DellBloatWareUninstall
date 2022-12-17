#finds and uninstalls dell programs from their uninstall strings.
$dellprograms = get-itemproperty 'hklm:\software\wow6432node\microsoft\windows\currentversion\uninstall\*' | where {$_.displayname -like "*dell*"}
foreach ($program in $dellprograms)
{
    cmd /c $program.uninstallstring -silent
}
#Not all dell programs actually have uninstall strings. This section cleans up any stragglers.
$dellprograms = get-wmiobject -class win32_product | where {$_.name -like "*dell*"}
foreach ($program in $dellprograms)
{
    $program.uninstall()
}
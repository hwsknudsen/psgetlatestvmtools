$localpath = "C:\latest" 
$sourcedir = Invoke-WebRequest https://packages.vmware.com/tools/esx/latest/windows/x64/

$fileurl = $sourcedir.BaseResponse.ResponseUri.ToString() + $sourcedir.Links[1].href
$fullpath = $localpath +"\"+ $sourcedir.Links[1].href

if (test-path $fullpath){
    Write-Output "file already exisit"
} else {
    Start-BitsTransfer -Source $fileurl -Destination $fullpath
}

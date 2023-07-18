$FileName = [Math]::Round((Get-Date).ToFileTimeUTC()/10000)
$Directory = "1/$FileName"

echo "moving to client directory"
cd C:/Users/MATTH/OneDrive/Documents/GitHub/custom-expo-updates-server
echo "running expo export to bundle client update"
npx expo export --experimental-bundle
echo "moving to server side directory"
cd C:/Users/MATTH/OneDrive/Desktop/expo-updates-server
echo "testing updates directory"
$TestPath = "updates/$directory/"
if (Test-Path $TestPath) {
    Remove-Item -Recurse -Force $TestPath
}
echo "creating new updates directory"
New-Item -ItemType Directory -Force -Path $TestPath
echo " attempting to copy bundle to $TestPath"
Copy-Item -Recurse -Force C:/Users/MATTH/OneDrive/Documents/GitHub/custom-expo-updates-server/dist/* $TestPath

echo "trying to run config script"
node ./scripts/exportClientExpoConfig.js > updates/$directory/expoConfig.json
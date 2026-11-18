$hHello = '4f16ba63db93a18f1caaa525ae7e6c1ae1736935b1e59f280f461757ac7d2ebe'
$hNotes = '32b29527ab1770ace06418f832b3b2a2ca143efdc23b4c96df528a3d21561959'
$now = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
$indexPath = 'D:\_DEV\_TM\TMAdmin\tmp-custom-plugins-repo\index.json'
$json = Get-Content $indexPath -Raw | ConvertFrom-Json

$json.updatedAt = $now
$json.plugins[0].releases[0].sha256 = $hHello
$json.plugins[0].releases[0].releasedAt = $now
$json.plugins[1].releases[0].sha256 = $hNotes
$json.plugins[1].releases[0].releasedAt = $now

$json | ConvertTo-Json -Depth 10 | Set-Content $indexPath -Encoding utf8
$null = Get-Content $indexPath -Raw | ConvertFrom-Json
Write-Host 'SUCCESS'

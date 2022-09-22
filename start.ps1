# 実行中のパス取得/移動
$path = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $path

# ファイル書きこみ
# StreamReaderのコンストラクタに直接 「$path + "\test.txt"」を入力するとエラーになるので分ける

$Today = (Get-Date).ToString("yyyyMMdd")
$fileName = $path + "\source\" + $Today +".md"

$Tommorow = (Get-Date).AddDays(+1).ToString("yyyyMMdd")
$Yesterday = (Get-Date).AddDays(-1).ToString("yyyyMMdd")


$past = [DateTime]::ParseExact("20220922","yyyyMMdd", $null)
$days = (Get-Date) - $past


$file = New-Object System.IO.StreamWriter($fileName, $true, [System.Text.Encoding]::GetEncoding("utf-8"))
$file.WriteLine("---")
$file.WriteLine("title: " + $Today)
$file.WriteLine("yesterday: " + $Yesterday)
$file.WriteLine("tomorrow: " + $Tommorow)
$file.WriteLine("days: " + $days.days)
$file.WriteLine("author: Takala")
$file.WriteLine("header-includes:")
$file.WriteLine("  - \usepackage[margin=1in]{geometry}")
$file.WriteLine("  - \usepackage[ISO]{diffcoeff}")
$file.WriteLine("  - \usepackage{pxfonts}")
$file.WriteLine("---")
$file.WriteLine("")
$file.Close()

# 終了
# Write-Host("End")



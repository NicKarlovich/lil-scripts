$Dir = Read-Host -Prompt 'Input directory name: '
$Replace = '<style>.markdown-body table th{background-color: #282c34;}.markdown-body table tr{background-color: #282c34;}.markdown-body table tr:nth-child(2n){background-color: #373d48;}.preview-page{margin-top:0px;}#readme h3:first-child{display:none;}#grip-content h3{display:contents!important;}.container{width:auto!important;}del{color:red;}strong{color:lightgreen;}table{background-color:rgb(40,44,52);!importantcolor:white}h1{color:rgb(171,178,191);font-family:"consolas"!important;}h2{color:rgb(171,178,191);font-family:"consolas"!important;}h3{color:rgb(171,178,191);font-family:"consolas"!important;}h4{color:rgb(171,178,191);font-family:"consolas"!important;}p{color:rgb(171,178,191)!important;font-family:"consolas"!important;}table{background-color:rgb(40,44,52)!important;color:rgb(171,178,191);font-family:"consolas"!important;}tbody{background-color:rgb(40,44,52)!important;color:rgb(171,178,191)!important;font-family:"consolas"!important;}body{background-color:rgb(40,44,52)!important;font-family:"consolas"!important;margin:8px;padding:30px;}</style></head>'
$File = Read-Host -Prompt 'Input file name (No file extension): '
$HTML = 'temp.html'
$INPUTExt = ".md"
$OUTPUTExt = ".pdf"
grip .\$Dir\$File$INPUTExt --export .\$Dir\$HTML
$Content = Get-Content -Path .\$Dir\$HTML
$Content = $Content -replace '</head>', $Replace
$Content | Set-Content -Path .\$Dir\$HTML
& "C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe" $Dir\$HTML $Dir\$File$OUTPUTExt
Remove-Item .\$Dir\$HTML
PAUSE
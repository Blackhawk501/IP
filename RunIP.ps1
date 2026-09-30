# ============================================================
#  RunIP.ps1 - تحميل وتشغيل IP.bat من GitHub
# ============================================================

$url  = "https://raw.githubusercontent.com/Blackhawk501/IP/main/IP.bat"
$file = "$env:TEMP\IP.bat"

Write-Host "[*] جاري تحميل الملف..." -ForegroundColor Cyan

try {
    Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing -ErrorAction Stop
    Write-Host "[+] تم التحميل بنجاح: $file" -ForegroundColor Green
} catch {
    Write-Host "[-] فشل التحميل: $_" -ForegroundColor Red
    exit 1
}

# التأكد من أن الملف موجود قبل التشغيل
if (-not (Test-Path $file)) {
    Write-Host "[-] الملف غير موجود بعد التحميل!" -ForegroundColor Red
    exit 1
}

Write-Host "[*] جاري تشغيل الملف..." -ForegroundColor Cyan

Start-Process "cmd.exe" -ArgumentList "/c `"$file`"" -Wait

Write-Host "[+] انتهى التنفيذ." -ForegroundColor Green

# Vercel 환경변수 설정 안내
# Supabase URL과 anon key를 입력받아 Vercel CLI로 추가

Write-Host "Vercel 환경변수 설정" -ForegroundColor Cyan
Write-Host ""

$url = Read-Host "Supabase Project URL (예: https://xxxxx.supabase.co)"
$key = Read-Host "Supabase anon public key"

if ([string]::IsNullOrWhiteSpace($url) -or [string]::IsNullOrWhiteSpace($key)) {
    Write-Host "취소됨" -ForegroundColor Yellow
    exit 1
}

# Vercel CLI 확인
$vercel = Get-Command vercel -ErrorAction SilentlyContinue
if (-not $vercel) {
    Write-Host "Vercel CLI가 설치되어 있지 않습니다." -ForegroundColor Red
    Write-Host "설치: npm install -g vercel" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "또는 Vercel 대시보드에서 직접 추가하세요:" -ForegroundColor Cyan
    Write-Host "https://vercel.com/ypmgjuns-projects/crazy/settings/environment-variables" -ForegroundColor Gray
    Write-Host ""
    Write-Host "SUPABASE_URL = $url"
    Write-Host "SUPABASE_ANON_KEY = (입력한 키)"
    exit 1
}

# 환경변수 추가
$url | vercel env add SUPABASE_URL production
$key | vercel env add SUPABASE_ANON_KEY production

Write-Host ""
Write-Host "완료. Redeploy를 실행하세요." -ForegroundColor Green

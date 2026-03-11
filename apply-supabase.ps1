# Supabase 연동 적용 - 프로젝트 생성 후 실행
# 사용법: .\apply-supabase.ps1 -Url "https://xxxxx.supabase.co" -Key "eyJ..."

param(
    [Parameter(Mandatory=$true)]
    [string]$Url,
    [Parameter(Mandatory=$true)]
    [string]$Key
)

$ErrorActionPreference = "Stop"
$Url = $Url.Trim()
$Key = $Key.Trim()

if (-not $Url.StartsWith("https://")) {
    Write-Host "SUPABASE_URL must start with https://" -ForegroundColor Red
    exit 1
}

# Vercel env 업데이트
Write-Host "Updating Vercel env vars..." -ForegroundColor Cyan
vercel env rm SUPABASE_URL production -y 2>$null
vercel env add SUPABASE_URL production --value $Url --yes --force

vercel env rm SUPABASE_ANON_KEY production -y 2>$null
vercel env add SUPABASE_ANON_KEY production --value $Key --yes --force

Write-Host "Redeploying..." -ForegroundColor Cyan
vercel --prod

Write-Host "Done. Supabase connected." -ForegroundColor Green

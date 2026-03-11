# Supabase anon key 추가 (Settings > API 페이지에서 복사)
Start-Process "https://supabase.com/dashboard/project/hedaelfuyslrjadukswc/settings/api"
Write-Host "Supabase API 페이지에서 'anon public' 키를 복사한 뒤 Enter를 누르세요..." -ForegroundColor Yellow
Read-Host
$key = (Get-Clipboard -Format Text -ErrorAction SilentlyContinue).Trim()
if (-not $key -or $key.Length -lt 100) {
    Write-Host "클립보드에 유효한 키가 없습니다." -ForegroundColor Red
    exit 1
}
vercel env rm SUPABASE_ANON_KEY production -y 2>$null
$key | vercel env add SUPABASE_ANON_KEY production --force
Write-Host "Redeploying..." -ForegroundColor Cyan
vercel --prod
Write-Host "완료." -ForegroundColor Green

# Vercel 환경변수 설정

## 방법 1: 대시보드에서 직접 추가 (권장)

1. https://vercel.com/dashboard 접속 → **crazy** 프로젝트 선택
2. **Settings** → **Environment Variables**
3. **Add New** → 아래 추가:

| Name | Value |
|------|-------|
| `SUPABASE_URL` | Supabase Project URL |
| `SUPABASE_ANON_KEY` | Supabase anon public key |

4. **Save** 후 **Deployments** → 최신 배포 ⋮ → **Redeploy**

## 방법 2: 스크립트 사용 (Vercel CLI 필요)

```powershell
.\setup-vercel-env.ps1
```

Supabase 값은 [Supabase 대시보드](https://supabase.com/dashboard) → 프로젝트 → Settings → API에서 확인

# Vercel 환경변수 설정

Supabase 연동을 위해 Vercel 대시보드에서 다음 환경변수를 추가하세요:

1. [Vercel 프로젝트](https://vercel.com/dashboard) → 해당 프로젝트 선택
2. **Settings** → **Environment Variables**
3. 아래 변수 추가:

| Name | Value | Environment |
|------|-------|-------------|
| `SUPABASE_URL` | `https://xxxxx.supabase.co` | Production, Preview |
| `SUPABASE_ANON_KEY` | `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...` | Production, Preview |

4. **Save** 후 **Redeploy** (Deployments → 최신 배포 옆 ⋮ → Redeploy)

Supabase URL/Key는 [Supabase 대시보드](https://supabase.com/dashboard) → Settings → API에서 확인할 수 있습니다.

# Supabase 연동

## 1. Supabase 프로젝트 생성

1. https://supabase.com/dashboard/new 접속
2. New Project 생성 (이름: lotto-crazy 등)
3. Settings → API에서 **Project URL**, **anon public** 복사

## 2. Vercel 환경변수 적용

### 방법 A: 스크립트 (권장)

```powershell
.\apply-supabase.ps1 -Url "https://xxxxx.supabase.co" -Key "eyJ..."
```

### 방법 B: 대시보드

1. [Vercel → crazy-y5pu → Settings → Environment Variables](https://vercel.com/ypmgjuns-projects/crazy-y5pu/settings/environment-variables)
2. SUPABASE_URL, SUPABASE_ANON_KEY 수정 후 Redeploy

## 3. Supabase 테이블 생성

SQL Editor에서 `supabase-setup.sql` 내용 실행

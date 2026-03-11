-- Supabase SQL Editor에서 실행
-- 로또 추첨 결과 테이블 생성

CREATE TABLE lotto_draws (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  numbers INTEGER[] NOT NULL,
  bonus INTEGER,
  set_count INTEGER DEFAULT 1,
  user_id TEXT
);

CREATE INDEX idx_lotto_draws_created_at ON lotto_draws(created_at DESC);

ALTER TABLE lotto_draws ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can insert" ON lotto_draws
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Anyone can read" ON lotto_draws
  FOR SELECT USING (true);

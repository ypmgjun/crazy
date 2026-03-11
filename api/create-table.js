const { Client } = require('pg');

const SQL = `
CREATE TABLE IF NOT EXISTS lotto_draws (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  numbers INTEGER[] NOT NULL,
  bonus INTEGER,
  set_count INTEGER DEFAULT 1,
  user_id TEXT
);
CREATE INDEX IF NOT EXISTS idx_lotto_draws_created_at ON lotto_draws(created_at DESC);
ALTER TABLE lotto_draws ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Anyone can insert" ON lotto_draws;
CREATE POLICY "Anyone can insert" ON lotto_draws FOR INSERT WITH CHECK (true);
DROP POLICY IF EXISTS "Anyone can read" ON lotto_draws;
CREATE POLICY "Anyone can read" ON lotto_draws FOR SELECT USING (true);
`;

module.exports = async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Content-Type', 'application/json; charset=utf-8');
  const url = process.env.DATABASE_URL;
  if (!url) {
    return res.status(400).json({ ok: false, error: 'Vercel에 DATABASE_URL 환경변수를 추가하세요. Supabase > Settings > Database > Connection string (URI)' });
  }
  const client = new Client({ connectionString: url, ssl: { rejectUnauthorized: false } });
  try {
    await client.connect();
    await client.query(SQL);
    await client.end();
    res.json({ ok: true, message: 'lotto_draws 테이블 생성 완료' });
  } catch (e) {
    await client.end().catch(() => {});
    res.status(500).json({ ok: false, error: e.message });
  }
};

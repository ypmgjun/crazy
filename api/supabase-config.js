export default function handler(req, res) {
  const url = process.env.SUPABASE_URL || 'https://hedaelfuyslrjadukswc.supabase.co';
  const key = process.env.SUPABASE_ANON_KEY || '';
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.json({ url, key });
}

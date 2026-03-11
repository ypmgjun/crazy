export default function handler(req, res) {
  const url = process.env.SUPABASE_URL || 'https://ppnbaibdkwsttwakqqtg.supabase.co';
  const key = process.env.SUPABASE_ANON_KEY || process.env.SUPABASE_PUBLISHABLE_KEY || '';
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Content-Type', 'application/json; charset=utf-8');
  res.json({ url, key });
}

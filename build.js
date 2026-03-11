const fs = require('fs');
const path = require('path');

const root = __dirname;
const htmlPath = path.join(root, 'lotto-recommender.html');
const publicDir = path.join(root, 'public');

const SUPABASE_URL = (process.env.SUPABASE_URL || 'YOUR_SUPABASE_URL').trim();
const SUPABASE_ANON_KEY = (process.env.SUPABASE_ANON_KEY || 'YOUR_SUPABASE_ANON_KEY').trim();

let html = fs.readFileSync(htmlPath, 'utf8');
html = html.replace('__SUPABASE_URL__', SUPABASE_URL);
html = html.replace('__SUPABASE_ANON_KEY__', SUPABASE_ANON_KEY);

if (!fs.existsSync(publicDir)) fs.mkdirSync(publicDir, { recursive: true });
fs.writeFileSync(path.join(publicDir, 'lotto-recommender.html'), html);
console.log('Build complete: Supabase env vars injected');

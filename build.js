const fs = require('fs');
const path = require('path');

const htmlPath = path.join(__dirname, 'lotto-recommender.html');
let html = fs.readFileSync(htmlPath, 'utf8');

const SUPABASE_URL = process.env.SUPABASE_URL || 'YOUR_SUPABASE_URL';
const SUPABASE_ANON_KEY = process.env.SUPABASE_ANON_KEY || 'YOUR_SUPABASE_ANON_KEY';

html = html.replace('__SUPABASE_URL__', SUPABASE_URL);
html = html.replace('__SUPABASE_ANON_KEY__', SUPABASE_ANON_KEY);

fs.writeFileSync(htmlPath, html);
console.log('Build complete: Supabase env vars injected');

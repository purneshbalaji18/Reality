# ANTIGRAVITY 🧪

**Product Safety Intelligence for India**

Know what's really in your food, skincare, and household products.  
Scan a label, get the truth — backed by clinical toxicology data.

---

## 🏗️ Architecture

```
Flutter App (Android)
      │
      ▼
FastAPI Backend (Render)
      │
      ├── /api/v1/scan/ocr      → Image upload → Tesseract OCR → Ingredient analysis
      ├── /api/v1/scan/barcode   → Barcode lookup → Known product → Ingredient analysis
      ├── /api/v1/scan/text      → Raw text → Parse → Ingredient analysis
      │
      ▼
Supabase (PostgreSQL)
      ├── 50 priority ingredients
      ├── 340+ ingredient aliases (English)
      ├── Organ target impacts
      ├── Vulnerable population warnings
      ├── Regulatory status (FSSAI, CDSCO, BIS, EU, WHO)
      └── Known products (Open Food Facts)
```

---

## 🚀 Deployment Checklist (Render Free Tier)

### Step 1: Push code to GitHub

```bash
git add -A
git commit -m "Production-ready backend with all fixes"
git push origin main
```

### Step 2: Connect repo to Render

1. Go to [render.com](https://render.com)
2. **New → Web Service**
3. Connect your GitHub account
4. Select the **Reality** repository
5. Render auto-detects `render.yaml`

### Step 3: Set environment variables in Render dashboard

Go to **Environment** tab and add:

| Variable         | Required | Notes                                   |
|------------------|----------|-----------------------------------------|
| `SUPABASE_URL`   | ✅       | Your Supabase project URL               |
| `SUPABASE_KEY`   | ✅       | Supabase `anon` or `service_role` key   |
| `GROQ_API_KEY`   | Optional | For Llama 3.3 70B toxicology summaries  |
| `GEMINI_API_KEY`  | Optional | Fallback LLM if Groq unavailable       |
| `ENVIRONMENT`    | Auto     | Set to `production` by render.yaml      |

> ⚠️ **Never commit `.env` to GitHub.** It's in `.gitignore`.

### Step 4: Run schema + seeds in Supabase SQL Editor

Go to your Supabase project → **SQL Editor** → run these files **in exact order**:

```
1. db/seeds/000_schema.sql          ← Creates all tables and indexes
2. db/seeds/001_seed_ingredients.sql ← 50 priority ingredients
3. db/seeds/002_seed_aliases.sql     ← 340+ name aliases
4. db/seeds/003_seed_regulatory.sql  ← Regulatory authorities + status
5. db/seeds/004_seed_products.sql    ← Known Indian products
```

Copy-paste each file's contents into the SQL Editor and click **Run**.

### Step 5: Deploy — check startup logs for all ✓

After Render deploys, check the **Logs** tab. You should see:

```
─────────────────────────────────────────────
  ANTIGRAVITY BACKEND — STARTUP CHECK
─────────────────────────────────────────────
  Supabase      : ✓ Connected
  Alias cache   : ✓ 340 aliases loaded
  Ingredients   : ✓ 50 in database
  Groq API      : ✓ Key present
  Gemini API    : ✗ Key not set (rule-based fallback)
  Tesseract OCR : ✗ Not found (OCR disabled)
─────────────────────────────────────────────
```

> Note: Tesseract may not be available on Render free tier. OCR scan will be disabled but barcode and text scan work fine.

### Step 6: Test `/health` endpoint

```bash
curl https://your-app.onrender.com/health
```

Expected response:
```json
{
  "status": "healthy",
  "environment": "production",
  "alias_cache_count": 340,
  "supabase_connected": true
}
```

### Step 7: Test `/api/v1/scan/text` with Maggi ingredients

```bash
curl -X POST https://your-app.onrender.com/api/v1/scan/text \
  -H "Content-Type: application/json" \
  -d '{"raw_ingredient_text": "Wheat Flour, Palm Oil, Salt, Flavour Enhancer (INS 621), Colour (INS 102), Antioxidant (INS 319), Preservative (INS 211)"}'
```

You should see resolved ingredients with harm levels, organ targets, and a toxicology summary.

### Step 8: Copy the Render URL into Flutter `api_service.dart`

Replace the base URL in your Flutter app:

```dart
static const String baseUrl = 'https://your-app.onrender.com';
```

---

## 🧪 Running Tests

With the server running locally (`uvicorn app.main:app --reload`):

```bash
python test_pipeline.py
```

Tests 3 real Indian products:
1. **Glow & Lovely** — Fairness cream (skincare)
2. **Colgate Strong Teeth** — Toothpaste (personal care)
3. **Maggi 2-Minute Noodles** — Instant food (FMCG)

---

## 📁 Project Structure

```
antigravity/
├── app/
│   ├── main.py              ← FastAPI app + startup diagnostics
│   ├── config.py             ← Pydantic settings (env vars)
│   ├── db/
│   │   └── supabase.py       ← Supabase client manager
│   ├── routers/
│   │   └── scan.py           ← /api/v1/scan/* endpoints
│   ├── schemas/
│   │   └── scan.py           ← Pydantic response models
│   ├── services/
│   │   ├── barcode.py        ← Barcode → product lookup
│   │   ├── llm.py            ← Groq/Gemini toxicology summary
│   │   ├── lookup.py         ← Alias cache + ingredient resolution
│   │   └── ocr.py            ← Tesseract OCR service
│   └── static/
│       └── index.html        ← Web UI (single-file)
├── db/
│   └── seeds/
│       ├── 000_schema.sql    ← PostgreSQL DDL
│       ├── 001_seed_ingredients.sql
│       ├── 002_seed_aliases.sql
│       ├── 003_seed_regulatory.sql
│       └── 004_seed_products.sql
├── test_pipeline.py          ← E2E pipeline tests
├── requirements.txt
├── render.yaml               ← Render deployment config
├── Procfile                  ← Heroku-compatible fallback
├── .env.example              ← Template for env vars
└── .gitignore
```

---

## 📜 License

Private project. All rights reserved.

-- ============================================================
-- ANTIGRAVITY MVP — STEP 0: PostgreSQL SCHEMA DDL
-- Run this BEFORE any seed files (001–004)
-- ============================================================
--
-- EXECUTION ORDER:
--   1. 000_schema.sql          ← THIS FILE
--   2. 001_seed_ingredients.sql
--   3. 002_seed_aliases.sql
--   4. 003_seed_regulatory.sql
--   5. 004_seed_products.sql
--
-- PREREQUISITES:
--   • PostgreSQL 14+ with uuid-ossp and pg_trgm extensions
--   • Supabase project (extensions auto-enabled)
-- ============================================================

-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";


-- ══════════════════════════════════════════════════════════════
-- CUSTOM ENUM TYPES
-- ══════════════════════════════════════════════════════════════

CREATE TYPE harm_level_enum AS ENUM (
    'safe', 'low', 'moderate', 'high', 'critical', 'unknown'
);

CREATE TYPE carcinogen_class_enum AS ENUM (
    'group_1', 'group_2a', 'group_2b', 'group_3', 'not_evaluated'
);

CREATE TYPE evidence_quality_enum AS ENUM (
    'high', 'moderate', 'low'
);

CREATE TYPE regulatory_verdict_enum AS ENUM (
    'approved', 'approved_restricted', 'banned', 'under_review', 'not_evaluated'
);

CREATE TYPE alias_type_enum AS ENUM (
    'common_name', 'inci', 'trade_name', 'e_number', 'ins_number',
    'ci_number', 'abbreviation', 'chemical_name', 'fda_name', 'misspelling'
);

CREATE TYPE scan_source_enum AS ENUM (
    'barcode', 'ocr', 'text'
);


-- ══════════════════════════════════════════════════════════════
-- TABLE: product_categories
-- ══════════════════════════════════════════════════════════════

CREATE TABLE product_categories (
    id                  UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    slug                TEXT UNIQUE NOT NULL,
    display_name        TEXT NOT NULL,
    parent_category_id  UUID REFERENCES product_categories(id) ON DELETE SET NULL,
    default_route       TEXT,           -- oral, dermal, inhalation
    description         TEXT,
    icon_emoji          TEXT,
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);


-- ══════════════════════════════════════════════════════════════
-- TABLE: regulatory_authorities
-- ══════════════════════════════════════════════════════════════

CREATE TABLE regulatory_authorities (
    id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code        TEXT UNIQUE NOT NULL,       -- FSSAI, CDSCO, BIS, EU, WHO_JECFA
    full_name   TEXT NOT NULL,
    country     TEXT NOT NULL,              -- IN, EU, INTL
    domain      TEXT,                       -- food, cosmetics, all
    website     TEXT,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);


-- ══════════════════════════════════════════════════════════════
-- TABLE: ingredients
-- The core knowledge base. 50 priority ingredients for MVP.
-- ══════════════════════════════════════════════════════════════

CREATE TABLE ingredients (
    id                      UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    canonical_name          TEXT UNIQUE NOT NULL,
    iupac_name              TEXT,
    molecular_formula       TEXT,
    cas_number              TEXT,                   -- CAS Registry Number (e.g. 99-76-3)
    ins_number              TEXT,                   -- International Numbering System
    inci_name               TEXT,                   -- International Nomenclature of Cosmetic Ingredients

    -- Classification flags
    category                TEXT,                   -- preservative, surfactant, colorant, etc.
    product_types           TEXT[],                 -- food, cosmetics, household, etc.
    source                  TEXT,                   -- synthetic, natural, semi-synthetic

    -- Boolean classification flags (used by seed data)
    is_preservative         BOOLEAN DEFAULT FALSE,
    is_colorant             BOOLEAN DEFAULT FALSE,
    is_fragrance            BOOLEAN DEFAULT FALSE,
    is_natural              BOOLEAN DEFAULT FALSE,

    -- Harm assessment
    harm_level              TEXT NOT NULL DEFAULT 'unknown',
    description             TEXT,                   -- harm_summary: ≤2 sentence plain English
    mechanism_of_harm       TEXT,                   -- mechanism_description: detailed mechanism

    -- IARC / Carcinogen classification
    carcinogen_class        TEXT DEFAULT 'not_evaluated',

    -- Toxicological flags
    endocrine_disruptor     BOOLEAN DEFAULT FALSE,
    bioaccumulation         BOOLEAN DEFAULT FALSE,
    crosses_bbb             BOOLEAN DEFAULT FALSE,  -- crosses blood-brain barrier
    neurotoxic              BOOLEAN DEFAULT FALSE,
    hepatotoxic             BOOLEAN DEFAULT FALSE,
    nephrotoxic             BOOLEAN DEFAULT FALSE,
    reproductive_toxic      BOOLEAN DEFAULT FALSE,
    phototoxic              BOOLEAN DEFAULT FALSE,
    skin_sensitiser         BOOLEAN DEFAULT FALSE,

    -- Evidence quality
    evidence_quality        TEXT DEFAULT 'low',

    created_at              TIMESTAMPTZ NOT NULL DEFAULT now()
);


-- ══════════════════════════════════════════════════════════════
-- TABLE: ingredient_aliases
-- Maps every label name variant to a canonical ingredient.
-- ~340 aliases for 50 ingredients in MVP.
-- ══════════════════════════════════════════════════════════════

CREATE TABLE ingredient_aliases (
    id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    ingredient_id   UUID NOT NULL REFERENCES ingredients(id) ON DELETE CASCADE,
    alias_name      TEXT NOT NULL,
    alias_type      TEXT NOT NULL DEFAULT 'common_name',
    language        TEXT NOT NULL DEFAULT 'en',
    is_primary      BOOLEAN DEFAULT FALSE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),

    UNIQUE (alias_name, language)
);


-- ══════════════════════════════════════════════════════════════
-- TABLE: ingredient_organ_targets
-- Which organs/systems are affected by each ingredient.
-- ══════════════════════════════════════════════════════════════

CREATE TABLE ingredient_organ_targets (
    id                  UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    ingredient_id       UUID NOT NULL REFERENCES ingredients(id) ON DELETE CASCADE,
    organ_system        TEXT NOT NULL,           -- skin, liver, kidney, endocrine, nervous, etc.
    effect_description  TEXT,                    -- plain English effect description
    effect_type         TEXT,                    -- legacy column
    severity            TEXT NOT NULL DEFAULT 'low',
    exposure_route      TEXT,                    -- oral, dermal, inhalation, ocular
    is_chronic          BOOLEAN DEFAULT FALSE,
    evidence_quality    TEXT DEFAULT 'moderate',
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);


-- ══════════════════════════════════════════════════════════════
-- TABLE: ingredient_vulnerabilities
-- Which population groups are at higher risk.
-- ══════════════════════════════════════════════════════════════

CREATE TABLE ingredient_vulnerabilities (
    id                  UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    ingredient_id       UUID NOT NULL REFERENCES ingredients(id) ON DELETE CASCADE,
    population_group    TEXT NOT NULL,           -- pregnant, infants, children, asthmatic, eczema, g6pd_deficient
    risk_level          TEXT,
    risk_multiplier     FLOAT DEFAULT 1.0,
    explanation         TEXT,                    -- reason for elevated risk
    reason              TEXT,                    -- legacy column (some seeds use this)
    evidence_quality    TEXT DEFAULT 'moderate',
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);


-- ══════════════════════════════════════════════════════════════
-- TABLE: regulatory_status
-- Per-ingredient, per-authority regulatory verdicts.
-- ══════════════════════════════════════════════════════════════

CREATE TABLE regulatory_status (
    id                      UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    ingredient_id           UUID NOT NULL REFERENCES ingredients(id) ON DELETE CASCADE,
    authority_id            UUID REFERENCES regulatory_authorities(id) ON DELETE SET NULL,
    -- Legacy columns (for flat lookup.py cache compatibility)
    authority_code          TEXT,
    authority_name          TEXT,
    country                 TEXT,
    verdict                 TEXT NOT NULL DEFAULT 'not_evaluated',
    max_concentration_pct   FLOAT,
    restriction_notes       TEXT,
    regulation_ref          TEXT,
    is_india_eu_gap         BOOLEAN DEFAULT FALSE,
    effective_date          DATE,
    created_at              TIMESTAMPTZ NOT NULL DEFAULT now()
);


-- ══════════════════════════════════════════════════════════════
-- TABLE: products
-- Known products (from Open Food Facts or manual entry).
-- ══════════════════════════════════════════════════════════════

CREATE TABLE products (
    id                      UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name                    TEXT NOT NULL,
    brand                   TEXT,
    barcode                 TEXT UNIQUE,
    category_id             UUID REFERENCES product_categories(id) ON DELETE SET NULL,
    raw_ingredient_text     TEXT,
    verified                BOOLEAN DEFAULT FALSE,
    image_url               TEXT,
    created_at              TIMESTAMPTZ NOT NULL DEFAULT now()
);


-- ══════════════════════════════════════════════════════════════
-- TABLE: product_ingredients
-- Junction table linking products to their ingredients.
-- ══════════════════════════════════════════════════════════════

CREATE TABLE product_ingredients (
    id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    product_id      UUID NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    ingredient_id   UUID REFERENCES ingredients(id) ON DELETE SET NULL,
    position        INT,                    -- order on label
    raw_name_on_label TEXT,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);


-- ══════════════════════════════════════════════════════════════
-- TABLE: scan_logs
-- Audit trail of every scan performed.
-- ══════════════════════════════════════════════════════════════

CREATE TABLE scan_logs (
    id                  UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    source              TEXT NOT NULL DEFAULT 'text',  -- barcode, ocr, text
    raw_text            TEXT,
    overall_harm_level  TEXT,
    resolved_count      INT DEFAULT 0,
    unresolved_count    INT DEFAULT 0,
    product_id          UUID REFERENCES products(id) ON DELETE SET NULL,
    user_agent          TEXT,
    ip_address          INET,
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);


-- ══════════════════════════════════════════════════════════════
-- INDEXES — Performance-critical queries
-- ══════════════════════════════════════════════════════════════

-- Most frequent query: alias → ingredient_id resolution
CREATE INDEX idx_ingredient_aliases_alias_name
    ON ingredient_aliases (lower(alias_name));

-- Trigram index for fuzzy alias matching (future feature)
CREATE INDEX idx_ingredient_aliases_alias_trgm
    ON ingredient_aliases USING gin (alias_name gin_trgm_ops);

-- Filter ingredients by harm level
CREATE INDEX idx_ingredients_harm_level
    ON ingredients (harm_level);

-- Regulatory lookups per ingredient + country
CREATE INDEX idx_regulatory_status_ingredient_country
    ON regulatory_status (ingredient_id, country);

-- Regulatory lookups by authority
CREATE INDEX idx_regulatory_status_authority
    ON regulatory_status (authority_id);

-- Scan log time-series queries
CREATE INDEX idx_scan_logs_created_at
    ON scan_logs (created_at DESC);

-- Product barcode lookups
CREATE INDEX idx_products_barcode
    ON products (barcode) WHERE barcode IS NOT NULL;

-- Product category lookups
CREATE INDEX idx_products_category
    ON products (category_id);


-- ══════════════════════════════════════════════════════════════
-- ROW LEVEL SECURITY (Supabase default — enable but allow all)
-- ══════════════════════════════════════════════════════════════

ALTER TABLE ingredients ENABLE ROW LEVEL SECURITY;
ALTER TABLE ingredient_aliases ENABLE ROW LEVEL SECURITY;
ALTER TABLE ingredient_organ_targets ENABLE ROW LEVEL SECURITY;
ALTER TABLE ingredient_vulnerabilities ENABLE ROW LEVEL SECURITY;
ALTER TABLE regulatory_status ENABLE ROW LEVEL SECURITY;
ALTER TABLE regulatory_authorities ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_ingredients ENABLE ROW LEVEL SECURITY;
ALTER TABLE scan_logs ENABLE ROW LEVEL SECURITY;

-- Allow anonymous/service-role reads for the API
CREATE POLICY "Allow public read on ingredients"
    ON ingredients FOR SELECT USING (true);
CREATE POLICY "Allow public read on ingredient_aliases"
    ON ingredient_aliases FOR SELECT USING (true);
CREATE POLICY "Allow public read on ingredient_organ_targets"
    ON ingredient_organ_targets FOR SELECT USING (true);
CREATE POLICY "Allow public read on ingredient_vulnerabilities"
    ON ingredient_vulnerabilities FOR SELECT USING (true);
CREATE POLICY "Allow public read on regulatory_status"
    ON regulatory_status FOR SELECT USING (true);
CREATE POLICY "Allow public read on regulatory_authorities"
    ON regulatory_authorities FOR SELECT USING (true);
CREATE POLICY "Allow public read on product_categories"
    ON product_categories FOR SELECT USING (true);
CREATE POLICY "Allow public read on products"
    ON products FOR SELECT USING (true);
CREATE POLICY "Allow public read on product_ingredients"
    ON product_ingredients FOR SELECT USING (true);
CREATE POLICY "Allow service insert on scan_logs"
    ON scan_logs FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public read on scan_logs"
    ON scan_logs FOR SELECT USING (true);


-- ============================================================
-- SCHEMA COMPLETE
-- Now run: 001 → 002 → 003 → 004 seed files in order.
-- ============================================================

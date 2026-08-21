-- ============================================================
-- ANTIGRAVITY MVP — STEP 3: REGULATORY STATUS SEED
-- 50 ingredients × 5 authorities (where applicable)
-- ============================================================
--
-- AUTHORITY PRIORITY: FSSAI → CDSCO → BIS → EU → WHO/JECFA
--
-- VERDICTS:
--   'approved'            = Explicitly permitted, no restrictions
--   'approved_restricted' = Permitted with concentration/usage limits
--   'banned'              = Prohibited
--   'under_review'        = Currently being evaluated
--   'not_evaluated'       = No specific regulation exists
--
-- REGULATION REFERENCES:
--   FSSAI:  FSS (Food Products Standards & Food Additives) Regs 2011
--   CDSCO:  Drugs & Cosmetics Act 1940, Rules 1945, Schedule Q
--   BIS:    IS 4707 (Cosmetics), IS 4955 (Detergents), etc.
--   EU:     EC 1333/2008 (Food), EC 1223/2009 (Cosmetics)
--   JECFA:  Joint FAO/WHO Expert Committee evaluations
--
-- ⚠️  INDIA-EU GAPS are flagged with comments
-- ============================================================

BEGIN;

-- ──────────────────────────────────────────────────────────────
-- REGULATORY AUTHORITIES
-- ──────────────────────────────────────────────────────────────
INSERT INTO regulatory_authorities (id, code, full_name, country, domain, website) VALUES
('b0000000-0000-4000-a000-000000000001', 'FSSAI', 'Food Safety and Standards Authority of India', 'IN', 'food', 'https://fssai.gov.in'),
('b0000000-0000-4000-a000-000000000002', 'CDSCO', 'Central Drugs Standard Control Organisation', 'IN', 'cosmetics', 'https://cdsco.gov.in'),
('b0000000-0000-4000-a000-000000000003', 'BIS', 'Bureau of Indian Standards', 'IN', 'all', 'https://www.bis.gov.in'),
('b0000000-0000-4000-a000-000000000004', 'EU', 'European Union (EFSA/SCCS)', 'EU', 'all', 'https://eur-lex.europa.eu'),
('b0000000-0000-4000-a000-000000000005', 'WHO_JECFA', 'WHO/FAO Joint Expert Committee on Food Additives', 'INTL', 'food', 'https://www.who.int/groups/joint-fao-who-expert-committee-on-food-additives');


-- ──────────────────────────────────────────────────────────────
-- PRODUCT CATEGORIES (needed for Step 4)
-- ──────────────────────────────────────────────────────────────
INSERT INTO product_categories (id, slug, display_name, parent_category_id, default_route, description) VALUES
-- Top-level
('c0000000-0000-4000-a000-000000000001', 'food',          'Food & Beverages',  NULL, 'oral',    'Edible food products and drinks'),
('c0000000-0000-4000-a000-000000000002', 'skincare',      'Skincare',          NULL, 'dermal',  'Skin care and cosmetic products'),
('c0000000-0000-4000-a000-000000000003', 'personal_care', 'Personal Care',     NULL, 'dermal',  'Oral care, hair care, body care'),
('c0000000-0000-4000-a000-000000000004', 'cleaning',      'Household Cleaning',NULL, 'dermal',  'Cleaning and disinfecting products'),
-- Food subcategories
('c0000000-0000-4000-a000-000000000010', 'instant_noodles','Instant Noodles',  'c0000000-0000-4000-a000-000000000001', 'oral', NULL),
('c0000000-0000-4000-a000-000000000011', 'biscuits',      'Biscuits & Cookies','c0000000-0000-4000-a000-000000000001', 'oral', NULL),
('c0000000-0000-4000-a000-000000000012', 'snacks',        'Snacks',            'c0000000-0000-4000-a000-000000000001', 'oral', NULL),
('c0000000-0000-4000-a000-000000000013', 'beverages',     'Beverages',         'c0000000-0000-4000-a000-000000000001', 'oral', NULL),
('c0000000-0000-4000-a000-000000000014', 'dairy',         'Dairy Products',    'c0000000-0000-4000-a000-000000000001', 'oral', NULL),
('c0000000-0000-4000-a000-000000000015', 'condiments',    'Condiments & Sauces','c0000000-0000-4000-a000-000000000001','oral', NULL),
('c0000000-0000-4000-a000-000000000016', 'breakfast_drink','Health/Malt Drinks','c0000000-0000-4000-a000-000000000001', 'oral', NULL),
('c0000000-0000-4000-a000-000000000017', 'juices',        'Juices & Fruit Drinks','c0000000-0000-4000-a000-000000000001','oral', NULL),
-- Skincare subcategories
('c0000000-0000-4000-a000-000000000020', 'fairness_cream','Fairness/Brightening Cream','c0000000-0000-4000-a000-000000000002','dermal', NULL),
('c0000000-0000-4000-a000-000000000021', 'moisturizer',   'Moisturizer',       'c0000000-0000-4000-a000-000000000002', 'dermal', NULL),
('c0000000-0000-4000-a000-000000000022', 'face_wash',     'Face Wash',         'c0000000-0000-4000-a000-000000000002', 'dermal', NULL),
('c0000000-0000-4000-a000-000000000023', 'lotion',        'Body Lotion',       'c0000000-0000-4000-a000-000000000002', 'dermal', NULL),
-- Personal care subcategories
('c0000000-0000-4000-a000-000000000030', 'toothpaste',    'Toothpaste',        'c0000000-0000-4000-a000-000000000003', 'oral',   NULL),
('c0000000-0000-4000-a000-000000000031', 'shampoo',       'Shampoo',           'c0000000-0000-4000-a000-000000000003', 'dermal', NULL),
('c0000000-0000-4000-a000-000000000032', 'soap',          'Soap/Body Wash',    'c0000000-0000-4000-a000-000000000003', 'dermal', NULL),
('c0000000-0000-4000-a000-000000000033', 'deodorant',     'Deodorant',         'c0000000-0000-4000-a000-000000000003', 'dermal', NULL),
('c0000000-0000-4000-a000-000000000034', 'hair_oil',      'Hair Oil',          'c0000000-0000-4000-a000-000000000003', 'dermal', NULL),
-- Cleaning subcategories
('c0000000-0000-4000-a000-000000000040', 'disinfectant',  'Disinfectant/Antiseptic','c0000000-0000-4000-a000-000000000004','dermal', NULL),
('c0000000-0000-4000-a000-000000000041', 'floor_cleaner', 'Floor Cleaner',     'c0000000-0000-4000-a000-000000000004', 'dermal', NULL),
('c0000000-0000-4000-a000-000000000042', 'toilet_cleaner','Toilet Cleaner',    'c0000000-0000-4000-a000-000000000004', 'inhalation', NULL),
('c0000000-0000-4000-a000-000000000043', 'dishwash',      'Dishwashing',       'c0000000-0000-4000-a000-000000000004', 'dermal', NULL),
('c0000000-0000-4000-a000-000000000044', 'detergent',     'Laundry Detergent', 'c0000000-0000-4000-a000-000000000004', 'dermal', NULL),
('c0000000-0000-4000-a000-000000000045', 'glass_cleaner', 'Glass/Surface Cleaner','c0000000-0000-4000-a000-000000000004','inhalation', NULL),
('c0000000-0000-4000-a000-000000000046', 'insecticide',   'Insecticide/Repellent','c0000000-0000-4000-a000-000000000004','inhalation', NULL);


-- ══════════════════════════════════════════════════════════════
-- REGULATORY STATUS ENTRIES
-- Organized by ingredient for review
-- ══════════════════════════════════════════════════════════════

-- ──────────────────────────────────────────────────────────────
-- PRESERVATIVES (1–9)
-- ──────────────────────────────────────────────────────────────

-- 1. Methylparaben
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_concentration_pct, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000001', 'b0000000-0000-4000-a000-000000000002', 'approved_restricted', 0.4,
 'Max 0.4% as single paraben, 0.8% total parabens in cosmetics. Indian cosmetic rules follow BIS IS 4707.',
 'IS 4707:2001 / Drugs & Cosmetics Rules', '2001-01-01'),
('a0000000-0000-4000-a000-000000000001', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', 0.4,
 'Max 0.4% as single ester, 0.8% total parabens. Annex V entry 12.',
 'EC/1223/2009/Annex-V/12', '2009-11-30');

-- 2. Propylparaben
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_concentration_pct, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000002', 'b0000000-0000-4000-a000-000000000002', 'approved_restricted', 0.14,
 'Max 0.14% as sum of propylparaben and butylparaben.',
 'IS 4707:2001 / Drugs & Cosmetics Rules', '2001-01-01'),
('a0000000-0000-4000-a000-000000000002', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', 0.14,
 'Max 0.14% (sum of propyl- and butylparaben). Banned in leave-on products for diaper area of children under 3. Annex V entry 12a.',
 'EC/1223/2009/Annex-V/12a (amended EU/2014/358)', '2014-07-16');

-- 3. Butylparaben
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_concentration_pct, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000003', 'b0000000-0000-4000-a000-000000000002', 'approved_restricted', 0.14,
 'Max 0.14% (sum with propylparaben). India follows BIS limits.',
 'IS 4707:2001 / Drugs & Cosmetics Rules', '2001-01-01'),
('a0000000-0000-4000-a000-000000000003', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', 0.14,
 'Max 0.14% (sum of propyl- and butylparaben). Banned in leave-on products for diaper area of children under 3.',
 'EC/1223/2009/Annex-V/12a (amended EU/2014/358)', '2014-07-16');

-- 4. Sodium Benzoate (INS 211)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_concentration_pct, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000004', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted', NULL,
 'Permitted in various food categories. Max varies: 200 mg/kg in fruit juices, 600 mg/kg in carbonated beverages, etc. Per FSS Regulations Schedule A.',
 'FSS (Food Products Standards & Food Additives) Regulations 2011, Schedule A', '2011-08-01'),
('a0000000-0000-4000-a000-000000000004', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', NULL,
 'Permitted in food (EC 1333/2008) and cosmetics (EC 1223/2009 Annex V, max 2.5% as benzoic acid in rinse-off, 1.7% in oral, 0.5% leave-on).',
 'EC/1333/2008/Annex-II; EC/1223/2009/Annex-V/1', '2009-11-30'),
('a0000000-0000-4000-a000-000000000004', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted', NULL,
 'JECFA ADI: 0-5 mg/kg bw/day (as benzoic acid).',
 'JECFA 46th meeting (1996)', '1996-01-01');

-- 5. Potassium Sorbate (INS 202)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000005', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted',
 'Permitted. Max limits vary by food category per Schedule A.',
 'FSS Regulations 2011, Schedule A', '2011-08-01'),
('a0000000-0000-4000-a000-000000000005', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted in food (EC 1333/2008) and cosmetics (EC 1223/2009 Annex V, max 0.6% as acid).',
 'EC/1333/2008/Annex-II; EC/1223/2009/Annex-V/4', '2009-11-30'),
('a0000000-0000-4000-a000-000000000005', 'b0000000-0000-4000-a000-000000000005', 'approved',
 'JECFA ADI: 0-25 mg/kg bw/day (as sorbic acid).',
 'JECFA 61st meeting (2003)', '2003-01-01');

-- 6. DMDM Hydantoin
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_concentration_pct, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000006', 'b0000000-0000-4000-a000-000000000002', 'not_evaluated', NULL,
 'No specific CDSCO regulation on formaldehyde releasers. India has not set limits for free formaldehyde from preservatives in cosmetics.',
 NULL, NULL),
-- ⚠️  INDIA-EU GAP: India has no formaldehyde-releaser limit; EU caps at 0.2% free HCHO
('a0000000-0000-4000-a000-000000000006', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', 0.2,
 'Permitted as cosmetic preservative. Max 0.2% free formaldehyde in finished product. Must declare "contains formaldehyde" if >0.05%. Annex V entry 13.',
 'EC/1223/2009/Annex-V/13', '2009-11-30');

-- 7. Imidazolidinyl Urea
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_concentration_pct, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000007', 'b0000000-0000-4000-a000-000000000002', 'not_evaluated', NULL,
 'No specific CDSCO regulation. Same gap as DMDM Hydantoin.',
 NULL, NULL),
-- ⚠️  INDIA-EU GAP: Same as #6
('a0000000-0000-4000-a000-000000000007', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', 0.2,
 'Max 0.2% free formaldehyde in finished product. Annex V entry 13.',
 'EC/1223/2009/Annex-V/13', '2009-11-30');

-- 8. BHA (INS 320)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000008', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted',
 'Permitted antioxidant in fats and oils. Max 200 mg/kg (alone or combined with BHT/TBHQ).',
 'FSS Regulations 2011, Schedule A', '2011-08-01'),
('a0000000-0000-4000-a000-000000000008', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted in certain food categories with specific limits. Also permitted in cosmetics.',
 'EC/1333/2008/Annex-II; EC/1223/2009/Annex-VI', '2009-11-30'),
('a0000000-0000-4000-a000-000000000008', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted',
 'JECFA ADI: 0-0.5 mg/kg bw/day.',
 'JECFA 46th meeting (1996)', '1996-01-01');

-- 9. BHT (INS 321)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000009', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted',
 'Permitted antioxidant. Max 200 mg/kg in fats and oils (alone or combined with BHA/TBHQ).',
 'FSS Regulations 2011, Schedule A', '2011-08-01'),
('a0000000-0000-4000-a000-000000000009', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted in certain food categories with specific limits.',
 'EC/1333/2008/Annex-II', '2008-12-16'),
('a0000000-0000-4000-a000-000000000009', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted',
 'JECFA ADI: 0-0.3 mg/kg bw/day.',
 'JECFA 44th meeting (1995)', '1995-01-01');


-- ──────────────────────────────────────────────────────────────
-- SURFACTANTS (10–11)
-- ──────────────────────────────────────────────────────────────

-- 10. SLS
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000010', 'b0000000-0000-4000-a000-000000000002', 'approved',
 'Permitted in cosmetics. No specific concentration limit in Indian regulations. Widely used.',
 'Drugs & Cosmetics Rules 1945'),
('a0000000-0000-4000-a000-000000000010', 'b0000000-0000-4000-a000-000000000004', 'approved',
 'Permitted in cosmetics. No specific concentration limit. CIR concluded safe up to 2% in leave-on, higher in rinse-off.',
 'EC/1223/2009 (not restricted)');

-- 11. SLES
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000011', 'b0000000-0000-4000-a000-000000000002', 'approved',
 'Permitted in cosmetics. No concentration limits.',
 'Drugs & Cosmetics Rules 1945'),
('a0000000-0000-4000-a000-000000000011', 'b0000000-0000-4000-a000-000000000004', 'approved',
 'Permitted. EU recommends manufacturers strip 1,4-dioxane residues to <10 ppm.',
 'EC/1223/2009 (not restricted); SCCS/1570/12');


-- ──────────────────────────────────────────────────────────────
-- FOOD COLORS — AZO DYES (12–17)
-- ──────────────────────────────────────────────────────────────

-- 12. Tartrazine (INS 102)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000012', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted',
 'Permitted food colour. Max limits vary per category. Must be declared on label as "Colour (INS 102)" or by name.',
 'FSS Regulations 2011, Schedule A; FSS (Labelling & Display) Regulations', '2011-08-01'),
-- ⚠️  INDIA-EU GAP: India has no mandatory hyperactivity warning; EU requires it
('a0000000-0000-4000-a000-000000000012', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted but MANDATORY WARNING LABEL: "may have an adverse effect on activity and attention in children." (Southampton colours).',
 'EC/1333/2008/Annex-V', '2010-07-20'),
('a0000000-0000-4000-a000-000000000012', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted',
 'JECFA ADI: 0-10 mg/kg bw/day (revised 2016, previously 0-7.5).',
 'JECFA 82nd meeting (2016)', '2016-01-01');

-- 13. Sunset Yellow FCF (INS 110)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000013', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted',
 'Permitted food colour per Schedule A.',
 'FSS Regulations 2011, Schedule A', '2011-08-01'),
('a0000000-0000-4000-a000-000000000013', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted with mandatory hyperactivity warning label.',
 'EC/1333/2008/Annex-V', '2010-07-20'),
('a0000000-0000-4000-a000-000000000013', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted',
 'JECFA ADI: 0-4 mg/kg bw/day.',
 'JECFA 82nd meeting (2016)', '2016-01-01');

-- 14. Ponceau 4R (INS 124)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000014', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted',
 'Permitted food colour per Schedule A.',
 'FSS Regulations 2011, Schedule A', '2011-08-01'),
-- ⚠️  INDIA-GLOBAL GAP: Permitted in India, BANNED by FDA in USA
('a0000000-0000-4000-a000-000000000014', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted with mandatory hyperactivity warning label. Not approved by US FDA.',
 'EC/1333/2008/Annex-V', '2010-07-20'),
('a0000000-0000-4000-a000-000000000014', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted',
 'JECFA ADI: 0-4 mg/kg bw/day.',
 'JECFA 82nd meeting (2016)', '2016-01-01');

-- 15. Allura Red AC (INS 129)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000015', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted',
 'Permitted food colour per Schedule A.',
 'FSS Regulations 2011, Schedule A', '2011-08-01'),
('a0000000-0000-4000-a000-000000000015', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted with mandatory hyperactivity warning label.',
 'EC/1333/2008/Annex-V', '2010-07-20'),
('a0000000-0000-4000-a000-000000000015', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted',
 'JECFA ADI: 0-7 mg/kg bw/day.',
 'JECFA 80th meeting (2015)', '2015-01-01');

-- 16. Brilliant Blue FCF (INS 133)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000016', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted',
 'Permitted food colour.',
 'FSS Regulations 2011, Schedule A', '2011-08-01'),
('a0000000-0000-4000-a000-000000000016', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted. Not one of the Southampton dyes — no mandatory warning label required.',
 'EC/1333/2008/Annex-II', '2008-12-16'),
('a0000000-0000-4000-a000-000000000016', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted',
 'JECFA ADI: 0-12.5 mg/kg bw/day.',
 'JECFA 74th meeting (2011)', '2011-01-01');

-- 17. Carmoisine (INS 122)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000017', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted',
 'Permitted food colour per Schedule A.',
 'FSS Regulations 2011, Schedule A', '2011-08-01'),
-- ⚠️  INDIA-GLOBAL GAP: Permitted in India, BANNED by FDA in USA and in Japan
('a0000000-0000-4000-a000-000000000017', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted with mandatory hyperactivity warning label. BANNED in USA (FDA) and Japan.',
 'EC/1333/2008/Annex-V', '2010-07-20'),
('a0000000-0000-4000-a000-000000000017', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted',
 'JECFA ADI: 0-4 mg/kg bw/day.',
 'JECFA 82nd meeting (2016)', '2016-01-01');


-- ──────────────────────────────────────────────────────────────
-- FOOD ADDITIVES & SWEETENERS (18–22, 43–44, 49–50)
-- ──────────────────────────────────────────────────────────────

-- 18. MSG (INS 621)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000018', 'b0000000-0000-4000-a000-000000000001', 'approved',
 'Permitted flavour enhancer. No max limit — GMP level. Must be declared on label.',
 'FSS Regulations 2011, Schedule A', '2011-08-01'),
('a0000000-0000-4000-a000-000000000018', 'b0000000-0000-4000-a000-000000000004', 'approved',
 'Permitted. No quantitative limit (quantum satis).',
 'EC/1333/2008/Annex-II', '2008-12-16'),
('a0000000-0000-4000-a000-000000000018', 'b0000000-0000-4000-a000-000000000005', 'approved',
 'JECFA: ADI "not specified" — considered safe, no limit needed.',
 'JECFA 31st meeting (1987)', '1987-01-01');

-- 19. Aspartame (INS 951)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_daily_intake, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000019', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted', 40.0,
 'Permitted artificial sweetener. Must carry warning "CONTAINS ASPARTAME (A SOURCE OF PHENYLALANINE)" on label.',
 'FSS Regulations 2011, Schedule A', '2011-08-01'),
('a0000000-0000-4000-a000-000000000019', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', 40.0,
 'Permitted. ADI 40 mg/kg bw/day maintained. IARC Group 2B (2023) did not change EU regulatory status. PKU warning required.',
 'EC/1333/2008/Annex-II', '2008-12-16'),
('a0000000-0000-4000-a000-000000000019', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted', 40.0,
 'JECFA ADI: 0-40 mg/kg bw/day. Reaffirmed July 2023 despite IARC 2B classification.',
 'JECFA 96th meeting (2023)', '2023-07-14');

-- 20. TBHQ (INS 319)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000020', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted',
 'Permitted antioxidant. Max 200 mg/kg in oils and fats (alone or combined with BHA/BHT).',
 'FSS Regulations 2011, Schedule A', '2011-08-01'),
('a0000000-0000-4000-a000-000000000020', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted in certain food categories. Max 200 mg/kg in fats and oils.',
 'EC/1333/2008/Annex-II', '2008-12-16'),
('a0000000-0000-4000-a000-000000000020', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted',
 'JECFA ADI: 0-0.7 mg/kg bw/day.',
 'JECFA 49th meeting (1997)', '1997-01-01');

-- 21. Phosphoric Acid (INS 338)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000021', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted',
 'Permitted acidity regulator in beverages and processed foods.',
 'FSS Regulations 2011, Schedule A'),
('a0000000-0000-4000-a000-000000000021', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted. EFSA group ADI for phosphates: 40 mg/kg bw/day (as phosphorus).',
 'EC/1333/2008/Annex-II; EFSA 2019 re-evaluation'),
('a0000000-0000-4000-a000-000000000021', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted',
 'JECFA MTDI: 70 mg/kg bw/day (as phosphorus, from all sources).',
 'JECFA 26th meeting (1982)');

-- 22. Calcium Disodium EDTA (INS 385)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000022', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted',
 'Permitted sequestrant in certain food categories.',
 'FSS Regulations 2011, Schedule A'),
('a0000000-0000-4000-a000-000000000022', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted with specific limits per food category.',
 'EC/1333/2008/Annex-II'),
('a0000000-0000-4000-a000-000000000022', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted',
 'JECFA ADI: 0-2.5 mg/kg bw/day (as calcium disodium EDTA).',
 'JECFA 61st meeting (2003)');

-- 43. Sodium Saccharin (INS 954)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_daily_intake, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000043', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted', 5.0,
 'Permitted artificial sweetener.',
 'FSS Regulations 2011, Schedule A'),
('a0000000-0000-4000-a000-000000000043', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', 5.0,
 'Permitted with specific limits. Delisted as carcinogen.',
 'EC/1333/2008/Annex-II'),
('a0000000-0000-4000-a000-000000000043', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted', 5.0,
 'JECFA ADI: 0-5 mg/kg bw/day.',
 'JECFA 37th meeting (1990)');

-- 44. Sodium Nitrite (INS 250)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000044', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted',
 'Permitted as preservative in processed meats. FSSAI max 200 mg/kg as nitrite ion.',
 'FSS Regulations 2011, Schedule A'),
('a0000000-0000-4000-a000-000000000044', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted in meat products. Max 150 mg/kg ingoing. EFSA 2017 re-evaluation maintained limits.',
 'EC/1333/2008/Annex-II'),
('a0000000-0000-4000-a000-000000000044', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted',
 'JECFA ADI: 0-0.07 mg/kg bw/day (as nitrite ion).',
 'JECFA 59th meeting (2002)');

-- 49. Sodium Metabisulfite (INS 223)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000049', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted',
 'Permitted preservative. Must be declared on label. FSSAI mandates sulfite labelling above 10 mg/kg.',
 'FSS Regulations 2011, Schedule A; FSS (Labelling) Regulations'),
('a0000000-0000-4000-a000-000000000049', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted. Must be labelled if >10 mg/kg SO2. EU mandatory allergen declaration.',
 'EC/1333/2008/Annex-II; Regulation (EU) 1169/2011'),
('a0000000-0000-4000-a000-000000000049', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted',
 'JECFA group ADI: 0-0.7 mg/kg bw/day (as SO2, total sulfites).',
 'JECFA 51st meeting (1998)');

-- 50. Acesulfame Potassium (INS 950)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_daily_intake, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000050', 'b0000000-0000-4000-a000-000000000001', 'approved_restricted', 15.0,
 'Permitted artificial sweetener.',
 'FSS Regulations 2011, Schedule A'),
('a0000000-0000-4000-a000-000000000050', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', 9.0,
 'Permitted. EFSA ADI: 9 mg/kg bw/day (2000).',
 'EC/1333/2008/Annex-II'),
('a0000000-0000-4000-a000-000000000050', 'b0000000-0000-4000-a000-000000000005', 'approved_restricted', 15.0,
 'JECFA ADI: 0-15 mg/kg bw/day.',
 'JECFA 37th meeting (1990)');


-- ──────────────────────────────────────────────────────────────
-- SKINCARE & COSMETICS (23–29, 47–48)
-- ──────────────────────────────────────────────────────────────

-- 23. Hydroquinone
-- ⚠️  CRITICAL INDIA-EU GAP: India allows prescription use; EU bans from cosmetics entirely
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_concentration_pct, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000023', 'b0000000-0000-4000-a000-000000000002', 'approved_restricted', 2.0,
 'PRESCRIPTION ONLY for skin lightening. Max 2%. Not permitted in OTC cosmetics. CDSCO classifies as drug for topical use above 2%.',
 'Drugs & Cosmetics Rules 1945; CDSCO notification', NULL),
('a0000000-0000-4000-a000-000000000023', 'b0000000-0000-4000-a000-000000000004', 'banned', NULL,
 'BANNED in cosmetic products (Annex II entry 1339). Only permitted in professional-use artificial nail systems and certain hair dye formulations under strict conditions.',
 'EC/1223/2009/Annex-II/1339', '2009-11-30');

-- 24. Mineral Oil
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000024', 'b0000000-0000-4000-a000-000000000002', 'approved',
 'Permitted in cosmetics. Must be cosmetic-grade (highly refined).',
 'Drugs & Cosmetics Rules 1945'),
('a0000000-0000-4000-a000-000000000024', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted only if full refining history is known and PAH content is negligible. Manufacturer must demonstrate adequate refining.',
 'EC/1223/2009 (not in Annex II if properly refined); SCCS/1495/12');

-- 25. Triclosan
-- ⚠️  INDIA-EU GAP: India has no specific triclosan restrictions; EU limits to 0.3%
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_concentration_pct, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000025', 'b0000000-0000-4000-a000-000000000002', 'not_evaluated', NULL,
 'No specific CDSCO regulation on triclosan concentration limits. Widely used in Indian soaps, toothpastes, deodorants without restriction.',
 NULL, NULL),
('a0000000-0000-4000-a000-000000000025', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', 0.3,
 'Max 0.3% in toothpaste, hand soap, body soap, face powder, blemish concealer. BANNED in all other leave-on and rinse-off cosmetics since 2014.',
 'EC/1223/2009/Annex-V/25 (amended by EU/2014/358)', '2014-07-16');

-- 26. DEA
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_concentration_pct, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000026', 'b0000000-0000-4000-a000-000000000002', 'not_evaluated', NULL,
 'No specific CDSCO regulation on DEA limits.',
 NULL),
('a0000000-0000-4000-a000-000000000026', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', 0.5,
 'Max 0.5% (as secondary amine). Must not be used with N-nitrosating agents. Max 50 µg/kg nitrosamine in finished product.',
 'EC/1223/2009/Annex-III/60');

-- 27. Propylene Glycol
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000027', 'b0000000-0000-4000-a000-000000000001', 'approved',
 'Permitted food additive (INS 1520). GRAS status.',
 'FSS Regulations 2011, Schedule A'),
('a0000000-0000-4000-a000-000000000027', 'b0000000-0000-4000-a000-000000000004', 'approved',
 'Permitted in food (EC 1333/2008) and cosmetics (no restrictions).',
 'EC/1333/2008/Annex-II; EC/1223/2009 (unrestricted)');

-- 28. Petrolatum
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000028', 'b0000000-0000-4000-a000-000000000002', 'approved',
 'Permitted in cosmetics. Must be pharmaceutical/cosmetic grade.',
 'Drugs & Cosmetics Rules 1945; Indian Pharmacopoeia'),
('a0000000-0000-4000-a000-000000000028', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted only when full refining history is known and the substance is proven non-carcinogenic.',
 'EC/1223/2009/Annex-II/1384 (mineral oils with unknown refining)');

-- 29. Isopropyl Alcohol
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000029', 'b0000000-0000-4000-a000-000000000002', 'approved',
 'Permitted as solvent/denaturant in cosmetics.',
 'Drugs & Cosmetics Rules 1945'),
('a0000000-0000-4000-a000-000000000029', 'b0000000-0000-4000-a000-000000000004', 'approved',
 'Permitted in cosmetics. No specific limit.',
 'EC/1223/2009 (unrestricted)');

-- 47. Oxybenzone
-- ⚠️  INDIA-GLOBAL GAP: No restrictions in India; banned in Hawaii, Palau
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_concentration_pct, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000047', 'b0000000-0000-4000-a000-000000000002', 'approved',
 'Permitted UV filter in sunscreens. No specific concentration limit in Indian regulations.',
 'Drugs & Cosmetics Rules 1945'),
('a0000000-0000-4000-a000-000000000047', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', 6.0,
 'Max 6% in sunscreens. Annex VI entry 4. Under SCCS re-evaluation due to endocrine concerns.',
 'EC/1223/2009/Annex-VI/4');

-- 48. Phenoxyethanol
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_concentration_pct, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000048', 'b0000000-0000-4000-a000-000000000002', 'approved',
 'Permitted preservative in cosmetics. No specific concentration limit in Indian regulations.',
 'Drugs & Cosmetics Rules 1945'),
('a0000000-0000-4000-a000-000000000048', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', 1.0,
 'Max 1.0% in all cosmetic products. Annex V entry 29.',
 'EC/1223/2009/Annex-V/29', '2009-11-30');


-- ──────────────────────────────────────────────────────────────
-- PERSONAL CARE (30)
-- ──────────────────────────────────────────────────────────────

-- 30. Sodium Fluoride
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_concentration_pct, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000030', 'b0000000-0000-4000-a000-000000000002', 'approved_restricted', 0.15,
 'Permitted in toothpaste. Max 0.15% (as fluoride, 1500 ppm). BIS IS 6356.',
 'BIS IS 6356:2001; Drugs & Cosmetics Rules'),
('a0000000-0000-4000-a000-000000000030', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', 0.15,
 'Max 0.15% fluoride in oral products. Must state "Contains Fluoride." Children products with 0.1-0.15% must say "For children 6+ supervised brushing recommended."',
 'EC/1223/2009/Annex-III/44');


-- ──────────────────────────────────────────────────────────────
-- CLEANING PRODUCTS (31–34, 45)
-- ──────────────────────────────────────────────────────────────

-- 31. Chloroxylenol
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000031', 'b0000000-0000-4000-a000-000000000003', 'approved_restricted',
 'Permitted antiseptic. BIS IS 697 covers household disinfectants. Concentration typically 4.8% in liquid antiseptics.',
 'BIS IS 697:2004 (Disinfectant fluids)'),
('a0000000-0000-4000-a000-000000000031', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted as cosmetic preservative. Max 0.5%. Annex V entry 19.',
 'EC/1223/2009/Annex-V/19');

-- 32. STPP
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000032', 'b0000000-0000-4000-a000-000000000003', 'approved',
 'Permitted in detergents. BIS IS 4955 covers synthetic detergents. No concentration limit in cleaning products.',
 'BIS IS 4955:2001 (Household synthetic detergent powder)'),
('a0000000-0000-4000-a000-000000000032', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'EU member states can restrict phosphates in detergents. EU Regulation 259/2012 limits phosphorus in laundry detergents to 0.5g/dose.',
 'EU Regulation 259/2012 (Detergents Regulation amendment)');

-- 33. Sodium Hypochlorite
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000033', 'b0000000-0000-4000-a000-000000000003', 'approved',
 'Permitted as household disinfectant/bleach. No specific BIS concentration limits for household bleach.',
 'BIS IS 11673:2020 (Sodium hypochlorite solution)'),
('a0000000-0000-4000-a000-000000000033', 'b0000000-0000-4000-a000-000000000004', 'approved',
 'Permitted for water treatment and cleaning. EU Biocidal Products Regulation (BPR) covers professional use.',
 'EU Regulation 528/2012 (BPR)');

-- 34. LAS
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000034', 'b0000000-0000-4000-a000-000000000003', 'approved',
 'Primary surfactant in Indian detergents. BIS IS 4955 specifies active detergent content min 14%.',
 'BIS IS 4955:2001'),
('a0000000-0000-4000-a000-000000000034', 'b0000000-0000-4000-a000-000000000004', 'approved',
 'Permitted. Must be biodegradable (>80% primary biodegradation per Detergents Regulation).',
 'EC/648/2004 (Detergents Regulation)');

-- 45. Sodium Hydroxide
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000045', 'b0000000-0000-4000-a000-000000000001', 'approved',
 'Permitted as acidity regulator (INS 524) in food.',
 'FSS Regulations 2011, Schedule A'),
('a0000000-0000-4000-a000-000000000045', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted in cosmetics as pH adjuster. Nail cuticle solvents: must state "Contains alkali. Avoid contact with eyes." Hair straighteners: max pH 12.7.',
 'EC/1223/2009/Annex-III/65');


-- ──────────────────────────────────────────────────────────────
-- MULTI-CATEGORY (35–42, 46)
-- ──────────────────────────────────────────────────────────────

-- 35. Talc
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000035', 'b0000000-0000-4000-a000-000000000002', 'approved',
 'Permitted in cosmetics and baby powder. No concentration limit. BIS IS 4707 Part I covers talcum powder.',
 'BIS IS 4707 (Part I):2020; Drugs & Cosmetics Rules'),
('a0000000-0000-4000-a000-000000000035', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted. Must be free of asbestiform amphibole fibres. Not for use in pressurized sprays (inhalation risk).',
 'EC/1223/2009; SCCS/1613/19');

-- 36. Titanium Dioxide (INS 171)
-- ⚠️  CRITICAL INDIA-EU GAP: FSSAI permits as food colour; EU BANNED as food additive since Feb 2022
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref, effective_date) VALUES
('a0000000-0000-4000-a000-000000000036', 'b0000000-0000-4000-a000-000000000001', 'approved',
 'Permitted food colour (INS 171). No specific max limit — quantum satis. FSSAI has NOT followed EU ban.',
 'FSS Regulations 2011, Schedule A', '2011-08-01'),
('a0000000-0000-4000-a000-000000000036', 'b0000000-0000-4000-a000-000000000004', 'banned', NULL,
 'BANNED as food additive (E171) since Feb 7, 2022. EFSA concluded it can no longer be considered safe due to genotoxicity concerns. Still allowed in cosmetics as CI 77891.',
 'EU/2022/63 (based on EFSA-Q-2020-00262)', '2022-02-07'),
('a0000000-0000-4000-a000-000000000036', 'b0000000-0000-4000-a000-000000000005', 'approved',
 'JECFA: ADI "not specified" (1969). NOTE: JECFA has not re-evaluated since EFSA 2021 opinion.',
 'JECFA 13th meeting (1969)', '1969-01-01');

-- 37. Aluminum Chlorohydrate
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000037', 'b0000000-0000-4000-a000-000000000002', 'approved',
 'Permitted in antiperspirants. No specific concentration limit in Indian regulations.',
 'Drugs & Cosmetics Rules 1945'),
('a0000000-0000-4000-a000-000000000037', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Permitted in antiperspirants. SCCS opinion (2020): safe at up to 10.6% (as aluminum chlorohydrate).',
 'EC/1223/2009; SCCS/1613/19 (re-evaluation pending)');

-- 38. Formaldehyde
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_concentration_pct, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000038', 'b0000000-0000-4000-a000-000000000002', 'not_evaluated', NULL,
 'No specific CDSCO regulation on free formaldehyde limits in cosmetics. Significant regulatory gap.',
 NULL),
-- ⚠️  INDIA-EU GAP: India has no formaldehyde limits; EU caps at 0.2% (preservative) or 5% (nail hardeners with warning)
('a0000000-0000-4000-a000-000000000038', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', 0.2,
 'Max 0.2% free formaldehyde as preservative. Max 5% in nail hardeners with mandatory warning. Must label "contains formaldehyde" above 0.05%. BANNED in aerosol products.',
 'EC/1223/2009/Annex-V/5; Annex-III/13');

-- 39. Fragrance (Parfum)
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000039', 'b0000000-0000-4000-a000-000000000002', 'approved',
 'Permitted. No requirement to disclose individual fragrance components in India.',
 'Drugs & Cosmetics Rules 1945'),
-- ⚠️  INDIA-EU GAP: India requires no fragrance allergen disclosure; EU mandates 26 allergens be named on label
('a0000000-0000-4000-a000-000000000039', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted',
 'Must individually declare 26 known fragrance allergens on label if above threshold (0.001% leave-on, 0.01% rinse-off). List expanded to 80+ allergens under pending revision.',
 'EC/1223/2009/Annex-III (entries 67-92); SCCS/1459/11');

-- 40. Dimethicone
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000040', 'b0000000-0000-4000-a000-000000000002', 'approved',
 'Permitted in cosmetics. No restrictions.',
 'Drugs & Cosmetics Rules 1945'),
('a0000000-0000-4000-a000-000000000040', 'b0000000-0000-4000-a000-000000000004', 'approved',
 'Permitted. No restrictions. Also permitted as food additive (E900) as anti-foaming agent.',
 'EC/1223/2009 (unrestricted); EC/1333/2008/Annex-II (E900)');

-- 41. TEA
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, max_concentration_pct, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000041', 'b0000000-0000-4000-a000-000000000002', 'not_evaluated', NULL,
 'No specific CDSCO regulation on TEA limits. No nitrosamine testing requirement in India.',
 NULL),
('a0000000-0000-4000-a000-000000000041', 'b0000000-0000-4000-a000-000000000004', 'approved_restricted', 2.5,
 'Max 2.5% in cosmetics. Must not be used with N-nitrosating substances. Max nitrosamine content 50 µg/kg. Min purity 99%.',
 'EC/1223/2009/Annex-III/61');

-- 42. PEG
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000042', 'b0000000-0000-4000-a000-000000000002', 'approved',
 'Permitted in cosmetics. No specific restrictions.',
 'Drugs & Cosmetics Rules 1945'),
('a0000000-0000-4000-a000-000000000042', 'b0000000-0000-4000-a000-000000000004', 'approved',
 'Permitted. EU recommends manufacturers control ethylene oxide and 1,4-dioxane residues.',
 'EC/1223/2009 (unrestricted)');

-- 46. Cocamidopropyl Betaine
INSERT INTO regulatory_status (ingredient_id, authority_id, verdict, restriction_notes, regulation_ref) VALUES
('a0000000-0000-4000-a000-000000000046', 'b0000000-0000-4000-a000-000000000002', 'approved',
 'Permitted in cosmetics. No restrictions.',
 'Drugs & Cosmetics Rules 1945'),
('a0000000-0000-4000-a000-000000000046', 'b0000000-0000-4000-a000-000000000004', 'approved',
 'Permitted. No restrictions. Manufacturers advised to minimize amidoamine impurities.',
 'EC/1223/2009 (unrestricted)');


COMMIT;

-- ============================================================
-- SEED COMPLETE: ~115 regulatory status entries
--
-- ⚠️  HIGH-PRIORITY INDIA-EU GAPS FLAGGED:
-- 
-- 1. TITANIUM DIOXIDE (#36)
--    India: APPROVED as food colour
--    EU:    BANNED as food additive since Feb 2022
--    → Highest priority warning item
--
-- 2. HYDROQUINONE (#23)
--    India: PRESCRIPTION-ONLY (but OTC enforcement gaps)
--    EU:    BANNED in all cosmetics
--    → Critical for fairness cream category
--
-- 3. FORMALDEHYDE / RELEASERS (#6, #7, #38)
--    India: NO REGULATION on free formaldehyde limits
--    EU:    Max 0.2% free formaldehyde, labelling required
--    → Affects shampoos, conditioners sold in India
--
-- 4. TRICLOSAN (#25)
--    India: NO RESTRICTIONS
--    EU:    Max 0.3%, limited to specific product types
--    → Affects antibacterial soaps widely sold in India
--
-- 5. AZO DYES (#12-15, #17)
--    India: Permitted, no hyperactivity warning
--    EU:    Mandatory child hyperactivity warning label
--    → Affects most coloured snacks and beverages
--
-- 6. FRAGRANCE ALLERGENS (#39)
--    India: No allergen disclosure requirement
--    EU:    Must name 26+ specific allergens on label
--    → Major transparency gap
--
-- 7. PONCEAU 4R & CARMOISINE (#14, #17)
--    India: APPROVED
--    USA:   BANNED (not approved by FDA)
--    → Products using these cannot be exported to USA
-- ============================================================

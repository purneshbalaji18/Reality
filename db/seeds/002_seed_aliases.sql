-- ============================================================
-- ANTIGRAVITY MVP — SEED DATA: INGREDIENT ALIASES
-- Every English name variant appearing on Indian product labels
-- ============================================================
--
-- ALIAS TYPES:
--   'common_name'   — How consumers know it
--   'inci'          — International Nomenclature of Cosmetic Ingredients
--   'trade_name'    — Brand/commercial names
--   'e_number'      — European food additive codes (used on Indian labels too)
--   'ins_number'    — International Numbering System (FSSAI uses this)
--   'ci_number'     — Colour Index number
--   'abbreviation'  — Short forms (SLS, BHA, MSG, etc.)
--   'chemical_name' — IUPAC or systematic chemical name
--   'fda_name'      — FD&C naming system
--   'misspelling'   — Common label typos/variants
--
-- All aliases are English. Hindi/Tamil aliases deferred to future sprint.
-- ============================================================

BEGIN;

-- ──────────────────────────────────────────────────────────────
-- 1. METHYLPARABEN
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000001', 'Methylparaben', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000001', 'Methyl Paraben', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000001', 'Methyl 4-Hydroxybenzoate', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000001', 'Methyl p-Hydroxybenzoate', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000001', 'E218', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000001', 'Nipagin M', 'trade_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000001', 'Methyl Parahydroxybenzoate', 'chemical_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 2. PROPYLPARABEN
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000002', 'Propylparaben', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000002', 'Propyl Paraben', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000002', 'Propyl 4-Hydroxybenzoate', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000002', 'Propyl p-Hydroxybenzoate', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000002', 'E216', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000002', 'Nipasol M', 'trade_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 3. BUTYLPARABEN
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000003', 'Butylparaben', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000003', 'Butyl Paraben', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000003', 'Butyl 4-Hydroxybenzoate', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000003', 'Butyl p-Hydroxybenzoate', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000003', 'E209', 'e_number', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 4. SODIUM BENZOATE
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000004', 'Sodium Benzoate', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000004', 'E211', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000004', 'INS 211', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000004', 'Benzoate of Soda', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000004', 'Benzoic Acid Sodium Salt', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000004', 'Preservative (211)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000004', 'Preservative E211', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000004', 'Preservative INS 211', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 5. POTASSIUM SORBATE
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000005', 'Potassium Sorbate', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000005', 'E202', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000005', 'INS 202', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000005', 'Preservative (202)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000005', 'Potassium Salt of Sorbic Acid', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000005', 'Preservative E202', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 6. DMDM HYDANTOIN
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000006', 'DMDM Hydantoin', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000006', 'DMDM', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000006', 'Dimethylol Dimethyl Hydantoin', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000006', '1,3-Dimethylol-5,5-Dimethylhydantoin', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000006', 'Glydant', 'trade_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 7. IMIDAZOLIDINYL UREA
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000007', 'Imidazolidinyl Urea', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000007', 'Germall 115', 'trade_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000007', 'Imidurea', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000007', 'Unicide U-13', 'trade_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 8. BUTYLATED HYDROXYANISOLE (BHA)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000008', 'BHA', 'abbreviation', 'en', TRUE),
('a0000000-0000-4000-a000-000000000008', 'Butylated Hydroxyanisole', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000008', 'E320', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000008', 'INS 320', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000008', 'Antioxidant (320)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000008', 'Antioxidant E320', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000008', 'tert-Butyl-4-Hydroxyanisole', 'chemical_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 9. BUTYLATED HYDROXYTOLUENE (BHT)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000009', 'BHT', 'abbreviation', 'en', TRUE),
('a0000000-0000-4000-a000-000000000009', 'Butylated Hydroxytoluene', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000009', 'E321', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000009', 'INS 321', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000009', 'Antioxidant (321)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000009', 'Antioxidant E321', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000009', 'Dibutylhydroxytoluene', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000009', '2,6-Di-tert-butyl-4-methylphenol', 'chemical_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 10. SODIUM LAURYL SULFATE (SLS)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000010', 'SLS', 'abbreviation', 'en', TRUE),
('a0000000-0000-4000-a000-000000000010', 'Sodium Lauryl Sulfate', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000010', 'Sodium Lauryl Sulphate', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000010', 'Sodium Dodecyl Sulfate', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000010', 'Sodium Dodecyl Sulphate', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000010', 'SDS', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000010', 'Lauryl Sodium Sulfate', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000010', 'Sodium Lauryl Ether Sulfate', 'misspelling', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 11. SODIUM LAURETH SULFATE (SLES)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000011', 'SLES', 'abbreviation', 'en', TRUE),
('a0000000-0000-4000-a000-000000000011', 'Sodium Laureth Sulfate', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000011', 'Sodium Laureth Sulphate', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000011', 'Sodium Lauryl Ether Sulphate', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000011', 'Sodium Laureth-2 Sulfate', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000011', 'Sodium Laureth-3 Sulfate', 'inci', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 12. TARTRAZINE (INS 102)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000012', 'Tartrazine', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000012', 'E102', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000012', 'INS 102', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000012', 'CI 19140', 'ci_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000012', 'FD&C Yellow 5', 'fda_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000012', 'Yellow 5', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000012', 'Acid Yellow 23', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000012', 'Colour (102)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000012', 'Color (102)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000012', 'Permitted Colour (102)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000012', 'Permitted Food Colour (INS 102)', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 13. SUNSET YELLOW FCF (INS 110)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000013', 'Sunset Yellow FCF', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000013', 'Sunset Yellow', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000013', 'E110', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000013', 'INS 110', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000013', 'CI 15985', 'ci_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000013', 'FD&C Yellow 6', 'fda_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000013', 'Yellow 6', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000013', 'Orange Yellow S', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000013', 'Colour (110)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000013', 'Permitted Food Colour (INS 110)', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 14. PONCEAU 4R (INS 124)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000014', 'Ponceau 4R', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000014', 'E124', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000014', 'INS 124', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000014', 'CI 16255', 'ci_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000014', 'Cochineal Red A', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000014', 'Brilliant Scarlet 4R', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000014', 'Colour (124)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000014', 'Permitted Food Colour (INS 124)', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 15. ALLURA RED AC (INS 129)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000015', 'Allura Red AC', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000015', 'Allura Red', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000015', 'E129', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000015', 'INS 129', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000015', 'CI 16035', 'ci_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000015', 'FD&C Red 40', 'fda_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000015', 'Red 40', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000015', 'Colour (129)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000015', 'Permitted Food Colour (INS 129)', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 16. BRILLIANT BLUE FCF (INS 133)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000016', 'Brilliant Blue FCF', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000016', 'Brilliant Blue', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000016', 'E133', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000016', 'INS 133', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000016', 'CI 42090', 'ci_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000016', 'FD&C Blue 1', 'fda_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000016', 'Blue 1', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000016', 'Colour (133)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000016', 'Permitted Food Colour (INS 133)', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 17. CARMOISINE (INS 122)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000017', 'Carmoisine', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000017', 'Azorubine', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000017', 'E122', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000017', 'INS 122', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000017', 'CI 14720', 'ci_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000017', 'Acid Red 14', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000017', 'Colour (122)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000017', 'Permitted Food Colour (INS 122)', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 18. MONOSODIUM GLUTAMATE (MSG)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000018', 'MSG', 'abbreviation', 'en', TRUE),
('a0000000-0000-4000-a000-000000000018', 'Monosodium Glutamate', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000018', 'E621', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000018', 'INS 621', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000018', 'Flavour Enhancer (621)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000018', 'Flavor Enhancer (621)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000018', 'Sodium Glutamate', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000018', 'Ajinomoto', 'trade_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000018', 'Flavour Enhancer INS 621', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000018', 'Hydrolyzed Vegetable Protein', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 19. ASPARTAME
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000019', 'Aspartame', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000019', 'E951', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000019', 'INS 951', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000019', 'NutraSweet', 'trade_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000019', 'Equal', 'trade_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000019', 'Sugar Free Gold', 'trade_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000019', 'Sweetener (951)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000019', 'Artificial Sweetener (INS 951)', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 20. TBHQ
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000020', 'TBHQ', 'abbreviation', 'en', TRUE),
('a0000000-0000-4000-a000-000000000020', 'Tertiary Butylhydroquinone', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000020', 'tert-Butylhydroquinone', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000020', 'E319', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000020', 'INS 319', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000020', 'Antioxidant (319)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000020', 'Antioxidant TBHQ', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000020', 'Antioxidant (INS 319)', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 21. PHOSPHORIC ACID
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000021', 'Phosphoric Acid', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000021', 'E338', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000021', 'INS 338', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000021', 'Orthophosphoric Acid', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000021', 'Acidity Regulator (338)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000021', 'Acidity Regulator (INS 338)', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 22. CALCIUM DISODIUM EDTA
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000022', 'Calcium Disodium EDTA', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000022', 'EDTA', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000022', 'E385', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000022', 'INS 385', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000022', 'Disodium EDTA', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000022', 'Edetate Calcium Disodium', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000022', 'Sequestrant (385)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000022', 'Tetrasodium EDTA', 'inci', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 23. HYDROQUINONE
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000023', 'Hydroquinone', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000023', 'Hydroquinon', 'misspelling', 'en', FALSE),
('a0000000-0000-4000-a000-000000000023', '1,4-Dihydroxybenzene', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000023', '1,4-Benzenediol', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000023', 'Quinol', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000023', 'HQ', 'abbreviation', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 24. MINERAL OIL
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000024', 'Mineral Oil', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000024', 'Paraffinum Liquidum', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000024', 'Liquid Paraffin', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000024', 'White Mineral Oil', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000024', 'Light Liquid Paraffin', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000024', 'Heavy Liquid Paraffin', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000024', 'Paraffin Oil', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000024', 'White Oil', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 25. TRICLOSAN
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000025', 'Triclosan', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000025', '5-Chloro-2-(2,4-dichlorophenoxy)phenol', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000025', 'Irgasan DP300', 'trade_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000025', 'Microban', 'trade_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 26. DIETHANOLAMINE (DEA)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000026', 'DEA', 'abbreviation', 'en', TRUE),
('a0000000-0000-4000-a000-000000000026', 'Diethanolamine', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000026', 'Cocamide DEA', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000026', 'Lauramide DEA', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000026', 'Linoleamide DEA', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000026', 'Oleamide DEA', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000026', '2,2-Iminodiethanol', 'chemical_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 27. PROPYLENE GLYCOL
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000027', 'Propylene Glycol', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000027', 'PG', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000027', 'E1520', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000027', 'INS 1520', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000027', '1,2-Propanediol', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000027', 'Methyl Ethyl Glycol', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000027', 'Humectant (1520)', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 28. PETROLATUM
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000028', 'Petrolatum', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000028', 'Petroleum Jelly', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000028', 'Vaseline', 'trade_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000028', 'White Petrolatum', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000028', 'Yellow Soft Paraffin', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000028', 'White Soft Paraffin', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000028', 'Mineral Jelly', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 29. ISOPROPYL ALCOHOL
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000029', 'Isopropyl Alcohol', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000029', 'IPA', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000029', 'Isopropanol', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000029', '2-Propanol', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000029', 'Rubbing Alcohol', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 30. SODIUM FLUORIDE
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000030', 'Sodium Fluoride', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000030', 'NaF', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000030', 'Sodium Monofluorophosphate', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000030', 'Fluoride', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 31. CHLOROXYLENOL
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000031', 'Chloroxylenol', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000031', 'PCMX', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000031', 'Para-Chloro-Meta-Xylenol', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000031', '4-Chloro-3,5-Dimethylphenol', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000031', 'Dettol Active', 'trade_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 32. SODIUM TRIPOLYPHOSPHATE
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000032', 'Sodium Tripolyphosphate', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000032', 'STPP', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000032', 'Pentasodium Triphosphate', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000032', 'Sodium Triphosphate', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000032', 'E451i', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000032', 'INS 451i', 'ins_number', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 33. SODIUM HYPOCHLORITE
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000033', 'Sodium Hypochlorite', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000033', 'Bleach', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000033', 'Liquid Bleach', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000033', 'Chlorine Bleach', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000033', 'NaOCl', 'abbreviation', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 34. LINEAR ALKYLBENZENE SULFONATE
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000034', 'Linear Alkylbenzene Sulfonate', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000034', 'LAS', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000034', 'LABS', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000034', 'Linear Alkylbenzene Sulphonate', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000034', 'Sodium Dodecylbenzenesulfonate', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000034', 'Alkylbenzene Sulfonate', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 35. TALC
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000035', 'Talc', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000035', 'Talcum', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000035', 'Talcum Powder', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000035', 'Magnesium Silicate', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000035', 'Hydrated Magnesium Silicate', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000035', 'CI 77718', 'ci_number', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 36. TITANIUM DIOXIDE
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000036', 'Titanium Dioxide', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000036', 'TiO2', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000036', 'E171', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000036', 'INS 171', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000036', 'CI 77891', 'ci_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000036', 'Colour (171)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000036', 'Titanium White', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 37. ALUMINUM CHLOROHYDRATE
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000037', 'Aluminum Chlorohydrate', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000037', 'Aluminium Chlorohydrate', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000037', 'ACH', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000037', 'Aluminum Zirconium Tetrachlorohydrex Gly', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000037', 'Aluminium Chloride Hydroxide', 'chemical_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 38. FORMALDEHYDE
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000038', 'Formaldehyde', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000038', 'Formalin', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000038', 'Methanal', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000038', 'Methyl Aldehyde', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000038', 'Formol', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000038', 'Oxomethane', 'chemical_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 39. FRAGRANCE (PARFUM)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000039', 'Fragrance', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000039', 'Parfum', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000039', 'Perfume', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000039', 'Aroma', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000039', 'Fragrance Oil', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000039', 'Added Flavour', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000039', 'Added Flavor', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000039', 'Natural Fragrance', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000039', 'Synthetic Fragrance', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 40. DIMETHICONE
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000040', 'Dimethicone', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000040', 'Polydimethylsiloxane', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000040', 'PDMS', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000040', 'Dimethylpolysiloxane', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000040', 'Silicone Oil', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000040', 'E900', 'e_number', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 41. TRIETHANOLAMINE (TEA)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000041', 'Triethanolamine', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000041', 'TEA', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000041', 'Trolamine', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000041', '2,2'',2''''-Nitrilotriethanol', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000041', 'Trihydroxytriethylamine', 'chemical_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 42. POLYETHYLENE GLYCOL (PEG)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000042', 'PEG', 'abbreviation', 'en', TRUE),
('a0000000-0000-4000-a000-000000000042', 'Polyethylene Glycol', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000042', 'PEG-100', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000042', 'PEG-40', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000042', 'PEG-7', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000042', 'PEG-150', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000042', 'PEG-8', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000042', 'Macrogol', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000042', 'Carbowax', 'trade_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 43. SODIUM SACCHARIN
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000043', 'Sodium Saccharin', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000043', 'Saccharin', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000043', 'Saccharine', 'misspelling', 'en', FALSE),
('a0000000-0000-4000-a000-000000000043', 'E954', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000043', 'INS 954', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000043', 'Sweetener (954)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000043', 'Artificial Sweetener (INS 954)', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 44. SODIUM NITRITE
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000044', 'Sodium Nitrite', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000044', 'E250', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000044', 'INS 250', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000044', 'Preservative (250)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000044', 'Nitrite', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000044', 'Curing Salt', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 45. SODIUM HYDROXIDE
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000045', 'Sodium Hydroxide', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000045', 'NaOH', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000045', 'Lye', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000045', 'Caustic Soda', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000045', 'E524', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000045', 'INS 524', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000045', 'Soda Lye', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 46. COCAMIDOPROPYL BETAINE
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000046', 'Cocamidopropyl Betaine', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000046', 'CAPB', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000046', 'Coco Betaine', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000046', 'Cocamidopropyl Dimethyl Glycine', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000046', 'Coconut Betaine', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 47. OXYBENZONE (BENZOPHENONE-3)
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000047', 'Oxybenzone', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000047', 'Benzophenone-3', 'inci', 'en', FALSE),
('a0000000-0000-4000-a000-000000000047', 'BP-3', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000047', '2-Hydroxy-4-Methoxybenzophenone', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000047', 'Eusolex 4360', 'trade_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000047', 'UV Filter Benzophenone', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 48. PHENOXYETHANOL
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000048', 'Phenoxyethanol', 'inci', 'en', TRUE),
('a0000000-0000-4000-a000-000000000048', '2-Phenoxyethanol', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000048', 'Phenoxetol', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000048', 'Ethylene Glycol Monophenyl Ether', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000048', 'PhE', 'abbreviation', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 49. SODIUM METABISULFITE
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000049', 'Sodium Metabisulfite', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000049', 'Sodium Metabisulphite', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000049', 'E223', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000049', 'INS 223', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000049', 'Sodium Pyrosulfite', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000049', 'Sodium Disulfite', 'chemical_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000049', 'Preservative (223)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000049', 'Sulphite', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000049', 'Sulfite', 'common_name', 'en', FALSE);

-- ──────────────────────────────────────────────────────────────
-- 50. ACESULFAME POTASSIUM
-- ──────────────────────────────────────────────────────────────
INSERT INTO ingredient_aliases (ingredient_id, alias_name, alias_type, language, is_primary) VALUES
('a0000000-0000-4000-a000-000000000050', 'Acesulfame Potassium', 'common_name', 'en', TRUE),
('a0000000-0000-4000-a000-000000000050', 'Acesulfame K', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000050', 'Ace-K', 'abbreviation', 'en', FALSE),
('a0000000-0000-4000-a000-000000000050', 'E950', 'e_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000050', 'INS 950', 'ins_number', 'en', FALSE),
('a0000000-0000-4000-a000-000000000050', 'Sweetener (950)', 'common_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000050', 'Sunett', 'trade_name', 'en', FALSE),
('a0000000-0000-4000-a000-000000000050', 'Artificial Sweetener (INS 950)', 'common_name', 'en', FALSE);


COMMIT;

-- ============================================================
-- SEED COMPLETE: ~340 aliases across 50 ingredients
-- 
-- COVERAGE BY ALIAS TYPE:
--   common_name   ~120 aliases (label-readable names)
--   inci          ~45  aliases (cosmetic nomenclature)
--   e_number      ~30  aliases (EU/FSSAI additive codes)
--   ins_number    ~25  aliases (FSSAI numbering system)
--   chemical_name ~55  aliases (IUPAC/systematic)
--   abbreviation  ~30  aliases (SLS, BHA, MSG, etc.)
--   ci_number     ~8   aliases (Colour Index)
--   trade_name    ~15  aliases (brand names)
--   fda_name      ~4   aliases (FD&C naming)
--   misspelling   ~4   aliases (common typos)
--
-- NEXT STEPS:
--   1. Add Hindi aliases (Devanagari script) for top ingredients
--   2. Add Tamil aliases for South Indian market
--   3. Expand misspelling coverage from real OCR scan data
-- ============================================================

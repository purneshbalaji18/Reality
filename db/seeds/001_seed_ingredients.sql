-- ============================================================
-- ANTIGRAVITY MVP — SEED DATA: 50 PRIORITY INGREDIENTS
-- Indian Market Focus
-- ============================================================
--
-- PREREQUISITES:
--   1. Run the schema DDL (CREATE TYPE, CREATE TABLE) first
--   2. Requires: pg_trgm extension enabled
--
-- DATA INTEGRITY NOTES:
--   • All harm_level, carcinogen_class, evidence_quality values
--     sourced from IARC monographs, JECFA evaluations, EU SCCS opinions,
--     FSSAI regulations, and published systematic reviews.
--   • LD50/NOAEL/TDI/ADI left NULL — fill from PubChem/JECFA monographs.
--   • harm_summary (description) kept to ≤2 sentences plain English.
--   • If evidence is weak or conflicting → evidence_quality = 'low'.
--   • If IARC has not evaluated → carcinogen_class = 'not_evaluated'.
--
-- UUID SCHEME: a0xxxxxx-0000-4000-a000-0000000000NN
-- ============================================================

BEGIN;

-- ──────────────────────────────────────────────────────────────
-- SECTION A: PRESERVATIVES (1–9)
-- ──────────────────────────────────────────────────────────────

-- 1. Methylparaben
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000001',
    'Methylparaben', '99-76-3', NULL, 'Methylparaben',
    'low', 'not_evaluated', 'moderate',
    TRUE, FALSE, FALSE, FALSE,
    TRUE, FALSE,
    'Weak estrogen mimic used as a preservative. Absorbed through skin and detected in human tissue, though direct harm at typical cosmetic concentrations remains debated.',
    'Binds to estrogen receptors with weak affinity (~1/10,000th of estradiol). Absorbed dermally. Detected in breast tumor tissue samples, though causal link to cancer is not established.'
);

-- 2. Propylparaben
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000002',
    'Propylparaben', '94-13-3', NULL, 'Propylparaben',
    'moderate', 'not_evaluated', 'moderate',
    TRUE, FALSE, FALSE, FALSE,
    TRUE, FALSE,
    'Stronger estrogen mimic than methylparaben. EU restricts it to 0.14% in cosmetics and bans it in leave-on products for children under 3.',
    'Higher estrogenic potency than methylparaben. Shown to reduce sperm counts and testosterone levels in animal studies. Crosses the skin barrier more readily due to longer alkyl chain.'
);

-- 3. Butylparaben
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000003',
    'Butylparaben', '94-26-8', NULL, 'Butylparaben',
    'moderate', 'not_evaluated', 'moderate',
    TRUE, FALSE, FALSE, FALSE,
    TRUE, FALSE,
    'Most potent estrogen-mimicking paraben. Linked to reproductive toxicity in animal studies and banned in products for children under 3 in several EU countries.',
    'Strongest estrogenic activity among common parabens. Demonstrated anti-androgenic effects in rodent studies. Affects male reproductive development at doses above typical cosmetic exposure.'
);

-- 4. Sodium Benzoate
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000004',
    'Sodium Benzoate', '532-32-1', '211', 'Sodium Benzoate',
    'low', 'not_evaluated', 'high',
    TRUE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Common food preservative, generally safe alone. Can combine with vitamin C (ascorbic acid) to form benzene, a known carcinogen, especially in acidic beverages.',
    'In acidic conditions with ascorbic acid, undergoes decarboxylation producing benzene. Also linked to hyperactivity in children when combined with certain azo dyes (Southampton study, 2007).'
);

-- 5. Potassium Sorbate
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000005',
    'Potassium Sorbate', '24634-61-5', '202', 'Potassium Sorbate',
    'safe', 'not_evaluated', 'high',
    TRUE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'One of the safest widely used preservatives. No significant toxicity concerns at permitted food and cosmetic levels. Approved globally.',
    'Metabolized via beta-oxidation like natural fatty acids. Rapidly cleared from the body. No accumulation. Minimal sensitization potential.'
);

-- 6. DMDM Hydantoin
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000006',
    'DMDM Hydantoin', '6440-58-0', NULL, 'DMDM Hydantoin',
    'high', 'not_evaluated', 'high',
    TRUE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Formaldehyde-releasing preservative. Releases formaldehyde (IARC Group 1 carcinogen) over time. Common cause of allergic contact dermatitis.',
    'Slowly releases free formaldehyde which acts as the antimicrobial agent. Formaldehyde is a known human carcinogen (nasopharyngeal cancer, leukemia). Causes skin sensitization via hapten formation with skin proteins.'
);

-- 7. Imidazolidinyl Urea
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000007',
    'Imidazolidinyl Urea', '39236-46-9', NULL, 'Imidazolidinyl Urea',
    'high', 'not_evaluated', 'high',
    TRUE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Formaldehyde-releasing preservative. One of the most common causes of cosmetic contact dermatitis. Releases formaldehyde, a known human carcinogen.',
    'Releases formaldehyde at a higher rate than DMDM Hydantoin. The released formaldehyde cross-links proteins, causing both antimicrobial action and allergic sensitization in skin.'
);

-- 8. Butylated Hydroxyanisole (BHA)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000008',
    'Butylated Hydroxyanisole', '25013-16-5', '320', 'BHA',
    'moderate', 'group_2b', 'moderate',
    TRUE, FALSE, FALSE, FALSE,
    TRUE, FALSE,
    'Synthetic antioxidant classified as possibly carcinogenic to humans (IARC Group 2B). Disrupts hormones in animal studies. California lists it under Prop 65.',
    'Causes forestomach tumors in rodents (species-specific relevance debated). Exhibits estrogenic and anti-androgenic activity. Interferes with thyroid hormone signaling in vitro.'
);

-- 9. Butylated Hydroxytoluene (BHT)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000009',
    'Butylated Hydroxytoluene', '128-37-0', '321', 'BHT',
    'low', 'not_evaluated', 'moderate',
    TRUE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Synthetic antioxidant. Generally considered safe at food-additive levels, but high doses cause liver enlargement and lung toxicity in animal studies.',
    'At high doses, induces hepatic microsomal enzymes and causes liver hypertrophy in rodents. Some evidence of lung toxicity in mice. Metabolized by cytochrome P450 system.'
);


-- ──────────────────────────────────────────────────────────────
-- SECTION B: SURFACTANTS (10–11)
-- ──────────────────────────────────────────────────────────────

-- 10. Sodium Lauryl Sulfate (SLS)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000010',
    'Sodium Lauryl Sulfate', '151-21-3', NULL, 'Sodium Lauryl Sulfate',
    'moderate', 'not_evaluated', 'high',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Strong surfactant that strips natural oils from skin and hair. Known skin and eye irritant. Not a carcinogen despite internet myths, but causes dryness and dermatitis with frequent use.',
    'Disrupts the skin lipid barrier by solubilizing intercellular lipids. Denatures proteins in the stratum corneum. Increases transepidermal water loss (TEWL). Severity is dose- and duration-dependent.'
);

-- 11. Sodium Laureth Sulfate (SLES)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000011',
    'Sodium Laureth Sulfate', '9004-82-4', NULL, 'Sodium Laureth Sulfate',
    'low', 'not_evaluated', 'moderate',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Milder surfactant than SLS, but manufacturing can leave traces of 1,4-dioxane, a probable carcinogen. Lower skin irritation risk than SLS.',
    'Ethoxylation of SLS creates a milder surfactant but can produce 1,4-dioxane (IARC Group 2B) as a byproduct. 1,4-dioxane is not intentionally added and can be removed by vacuum stripping.'
);


-- ──────────────────────────────────────────────────────────────
-- SECTION C: ARTIFICIAL FOOD COLORS — AZO DYES (12–17)
-- ──────────────────────────────────────────────────────────────

-- 12. Tartrazine (INS 102)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000012',
    'Tartrazine', '1934-21-0', '102', 'CI 19140',
    'moderate', 'not_evaluated', 'high',
    FALSE, TRUE, FALSE, FALSE,
    FALSE, FALSE,
    'Azo dye linked to hyperactivity in children (Southampton study). Can trigger allergic reactions and asthma, especially in aspirin-sensitive individuals. EU requires warning labels.',
    'Azo bond (–N=N–) metabolized by gut bacteria to aromatic amines. Triggers histamine release in sensitive individuals. Cross-reacts with aspirin sensitivity via cyclooxygenase pathway inhibition.'
);

-- 13. Sunset Yellow FCF (INS 110)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000013',
    'Sunset Yellow FCF', '2783-94-0', '110', 'CI 15985',
    'moderate', 'not_evaluated', 'high',
    FALSE, TRUE, FALSE, FALSE,
    FALSE, FALSE,
    'Azo dye linked to hyperactivity in children. EU requires warning label. Can cause allergic reactions, urticaria, and rhinitis in sensitive individuals.',
    'Metabolized by intestinal bacteria to sulfanilic acid and aminonaphthol. Associated with behavioral changes in children in the 2007 Southampton study. May exacerbate asthma symptoms.'
);

-- 14. Ponceau 4R (INS 124)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000014',
    'Ponceau 4R', '2611-82-7', '124', 'CI 16255',
    'moderate', 'not_evaluated', 'moderate',
    FALSE, TRUE, FALSE, FALSE,
    FALSE, FALSE,
    'Azo dye banned in the USA and Norway. Linked to hyperactivity in children. Permitted in India by FSSAI and in the EU with mandatory warning labels.',
    'Azo compound metabolized to aromatic amines by gut flora. Included in Southampton study mix linked to childhood hyperactivity. Banned by FDA due to insufficient safety data for US market.'
);

-- 15. Allura Red AC (INS 129)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000015',
    'Allura Red AC', '25956-17-6', '129', 'CI 16035',
    'moderate', 'not_evaluated', 'moderate',
    FALSE, TRUE, FALSE, FALSE,
    FALSE, FALSE,
    'Azo dye linked to hyperactivity in children. EU requires warning label. Recent animal studies suggest effects on gut microbiome and intestinal barrier at high doses.',
    'Metabolized to aromatic amines. 2022 McMaster University study showed exposure altered gut microbiome composition and increased intestinal permeability in mice. Relevance to human dietary levels uncertain.'
);

-- 16. Brilliant Blue FCF (INS 133)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000016',
    'Brilliant Blue FCF', '3844-45-9', '133', 'CI 42090',
    'low', 'not_evaluated', 'high',
    FALSE, TRUE, FALSE, FALSE,
    FALSE, FALSE,
    'Non-azo synthetic dye (triphenylmethane class) considered safer than azo dyes. Poorly absorbed from the GI tract. Rare allergic reactions possible.',
    'Triphenylmethane dye, not metabolized to aromatic amines like azo dyes. Very low oral absorption (<5%). Primarily excreted unchanged in feces. Rare IgE-mediated allergic reactions reported.'
);

-- 17. Carmoisine / Azorubine (INS 122)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000017',
    'Carmoisine', '3567-69-9', '122', 'CI 14720',
    'moderate', 'not_evaluated', 'moderate',
    FALSE, TRUE, FALSE, FALSE,
    FALSE, FALSE,
    'Azo dye banned in the USA, Japan, and Sweden. Linked to hyperactivity in children and allergic reactions. Permitted by FSSAI in India.',
    'Azo dye metabolized by intestinal azo-reductase to aromatic amine metabolites. Included in Southampton study color mixes. Can trigger pseudoallergic reactions in sensitive individuals.'
);


-- ──────────────────────────────────────────────────────────────
-- SECTION D: FOOD ADDITIVES & SWEETENERS (18–22, 43–44, 49–50)
-- ──────────────────────────────────────────────────────────────

-- 18. Monosodium Glutamate (MSG)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000018',
    'Monosodium Glutamate', '142-47-2', '621', NULL,
    'safe', 'not_evaluated', 'high',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Flavor enhancer. Despite widespread belief, extensive double-blind studies have not confirmed adverse reactions in the general population at normal food levels. FSSAI and FDA approved.',
    'Glutamate is a naturally occurring amino acid and neurotransmitter. Dietary MSG is metabolized in the gut; very little reaches systemic circulation. "Chinese Restaurant Syndrome" not reproducible in controlled studies.'
);

-- 19. Aspartame
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000019',
    'Aspartame', '22839-47-0', '951', NULL,
    'low', 'group_2b', 'high',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Artificial sweetener classified as possibly carcinogenic (IARC Group 2B) in 2023, but WHO simultaneously reaffirmed its safety at permitted levels. Unsafe for people with phenylketonuria (PKU).',
    'Metabolized to aspartate, phenylalanine, and methanol. IARC 2B classification based on limited evidence of hepatocellular carcinoma in some studies. JECFA maintained ADI, concluding evidence insufficient to change safety assessment.'
);

-- 20. TBHQ (Tertiary Butylhydroquinone)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000020',
    'Tertiary Butylhydroquinone', '1948-33-0', '319', 'TBHQ',
    'moderate', 'not_evaluated', 'moderate',
    TRUE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Synthetic antioxidant used in oils and snacks. High doses cause nausea, delirium, and collapse in humans. Some studies suggest effects on immune cell function. FSSAI permits up to 200 ppm in oils.',
    'At 1g dose in humans, causes nausea, vomiting, tinnitus, and delirium. In vitro studies show effects on T-cell and NK-cell function. Rapidly metabolized and excreted; low accumulation risk at food-additive levels.'
);

-- 21. Phosphoric Acid
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000021',
    'Phosphoric Acid', '7664-38-2', '338', NULL,
    'low', 'not_evaluated', 'moderate',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Acidulant used in colas and processed foods. Can erode tooth enamel and may reduce calcium absorption, potentially contributing to bone density loss with heavy consumption.',
    'Lowers oral pH causing dental enamel demineralization. High dietary phosphorus may disrupt calcium-phosphorus balance and increase parathyroid hormone secretion, accelerating bone resorption. Effect significant mainly at very high intake.'
);

-- 22. Calcium Disodium EDTA
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000022',
    'Calcium Disodium EDTA', '62-33-9', '385', 'Disodium EDTA',
    'low', 'not_evaluated', 'moderate',
    TRUE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Chelating agent that binds metals to preserve color and flavor. Safe at food-additive levels but may reduce absorption of essential minerals like zinc and iron.',
    'Chelates divalent and trivalent metal ions. At high doses can deplete essential minerals (zinc, iron, calcium) by binding them in the GI tract. Poorly absorbed orally (<5%), so systemic toxicity is low.'
);

-- 43. Sodium Saccharin
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000043',
    'Sodium Saccharin', '128-44-9', '954', NULL,
    'safe', 'not_evaluated', 'high',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Artificial sweetener once suspected of causing bladder cancer but delisted after extensive research showed the rodent mechanism is not relevant to humans. Safe at permitted levels.',
    'Rodent bladder tumors were caused by a rat-specific mechanism involving high-pH urinary precipitates of sodium saccharin. This mechanism does not occur in humans. Delisted from NTP carcinogen report in 2000.'
);

-- 44. Sodium Nitrite
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000044',
    'Sodium Nitrite', '7632-00-0', '250', NULL,
    'moderate', 'group_2a', 'high',
    TRUE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Meat preservative that can form carcinogenic nitrosamines in the body, especially when heated. IARC classifies ingested nitrite (under conditions of endogenous nitrosation) as Group 2A.',
    'Reacts with secondary amines in acidic conditions (stomach) or at high temperatures (cooking) to form N-nitroso compounds (nitrosamines), which are potent carcinogens. Also causes methemoglobinemia at high doses.'
);

-- 49. Sodium Metabisulfite
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000049',
    'Sodium Metabisulfite', '7681-57-4', '223', 'Sodium Metabisulfite',
    'moderate', 'not_evaluated', 'high',
    TRUE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Sulfite preservative that can trigger severe asthma attacks, bronchospasm, and anaphylaxis in sulfite-sensitive individuals (5-10% of asthmatics). FSSAI mandates label declaration.',
    'Releases sulfur dioxide (SO2) which irritates airways. In sulfite-sensitive asthmatics, triggers bronchoconstriction via cholinergic reflex and possible IgE-mediated mechanisms. Can also cause urticaria and GI distress.'
);

-- 50. Acesulfame Potassium
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000050',
    'Acesulfame Potassium', '55589-62-3', '950', NULL,
    'safe', 'not_evaluated', 'moderate',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Artificial sweetener approved globally. Not metabolized by the body and excreted unchanged. Some recent studies raise questions about gut microbiome effects, but regulatory consensus remains safe.',
    'Not metabolized; excreted unchanged in urine. Contains methylene chloride as a potential trace solvent from manufacturing, but at levels far below safety thresholds. Recent in-vitro studies on gut bacteria effects are preliminary.'
);


-- ──────────────────────────────────────────────────────────────
-- SECTION E: SKINCARE & COSMETICS (23–29, 47–48)
-- ──────────────────────────────────────────────────────────────

-- 23. Hydroquinone
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000023',
    'Hydroquinone', '123-31-9', NULL, 'Hydroquinone',
    'critical', 'group_3', 'high',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Skin-lightening agent banned in EU cosmetics and restricted to prescription-only in India (CDSCO). Prolonged use causes irreversible skin darkening (ochronosis) and organ damage.',
    'Inhibits tyrosinase enzyme to reduce melanin production. Chronic use causes exogenous ochronosis (paradoxical permanent darkening). Metabolized to reactive quinone intermediates that are nephrotoxic and hepatotoxic. Causes contact dermatitis.'
);

-- 24. Mineral Oil
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000024',
    'Mineral Oil', '8042-47-5', NULL, 'Paraffinum Liquidum',
    'low', 'not_evaluated', 'high',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Petroleum-derived moisturizer. Cosmetic-grade (highly refined) is generally safe. Poorly refined grades may contain carcinogenic polycyclic aromatic hydrocarbons (PAHs).',
    'Occlusive agent that prevents transepidermal water loss by forming a hydrophobic barrier. Not absorbed through intact skin. IARC classifies untreated/mildly treated mineral oils as Group 1 carcinogenic, but highly refined (cosmetic-grade) oils are Group 3.'
);

-- 25. Triclosan
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000025',
    'Triclosan', '3380-34-5', NULL, 'Triclosan',
    'high', 'not_evaluated', 'high',
    FALSE, FALSE, FALSE, FALSE,
    TRUE, TRUE,
    'Antibacterial agent banned by FDA in consumer hand soaps (2016). Disrupts thyroid and reproductive hormones. Contributes to antibiotic resistance. Still found in some Indian products.',
    'Disrupts thyroid hormone homeostasis by accelerating T4 metabolism. Shown to reduce muscle contractility in cardiac and skeletal muscle (animal studies). Promotes antibiotic-resistant bacteria via cross-resistance mechanisms. Bioaccumulates in fatty tissue.'
);

-- 26. Diethanolamine (DEA)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000026',
    'Diethanolamine', '111-42-2', NULL, 'DEA',
    'moderate', 'group_2b', 'moderate',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Foam booster that can react with other ingredients to form carcinogenic nitrosamines. IARC classifies it as possibly carcinogenic (Group 2B). EU restricts its use in cosmetics.',
    'Reacts with nitrosating agents (e.g., sodium nitrite preservatives) to form N-nitrosodiethanolamine (NDELA), a potent carcinogen. DEA itself causes liver and kidney tumors in mice via topical application. EU limits to 0.5% max.'
);

-- 27. Propylene Glycol
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000027',
    'Propylene Glycol', '57-55-6', '1520', 'Propylene Glycol',
    'low', 'not_evaluated', 'high',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Generally recognized as safe (GRAS) humectant. Can cause mild skin irritation and contact dermatitis at high concentrations in sensitive individuals. Very low systemic toxicity.',
    'Enhances skin penetration of other ingredients by disrupting the lipid barrier. Can cause irritant contact dermatitis at concentrations above 50%. Metabolized to lactic acid and pyruvic acid. Very low acute toxicity.'
);

-- 28. Petrolatum
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000028',
    'Petrolatum', '8009-03-8', NULL, 'Petrolatum',
    'safe', 'not_evaluated', 'high',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Petroleum-derived skin protectant. USP-grade petrolatum is thoroughly refined and considered safe. EU requires manufacturers to demonstrate full refining history.',
    'Fully refined petrolatum (USP/Ph.Eur. grade) is non-toxic, non-irritating, and non-comedogenic. EU concern is about PAH contamination in inadequately refined grades. Well-refined petrolatum has an excellent safety record.'
);

-- 29. Isopropyl Alcohol
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000029',
    'Isopropyl Alcohol', '67-63-0', NULL, 'Isopropyl Alcohol',
    'low', 'not_evaluated', 'high',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Drying solvent that strips natural moisture from skin. Toxic if ingested. Generally safe in rinse-off cosmetics and sanitizers at typical concentrations.',
    'Dissolves and removes skin surface lipids, increasing transepidermal water loss. Ingestion causes CNS depression, hypoglycemia, and metabolic acidosis via hepatic metabolism to acetone. Dermal absorption is minimal from brief exposure.'
);

-- 47. Oxybenzone (Benzophenone-3)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000047',
    'Oxybenzone', '131-57-7', NULL, 'Benzophenone-3',
    'moderate', 'not_evaluated', 'moderate',
    FALSE, FALSE, FALSE, FALSE,
    TRUE, FALSE,
    'UV filter in sunscreens shown to disrupt hormones. Detected in breast milk and urine of virtually all tested Americans. Banned in Hawaii and Palau for coral reef damage.',
    'Absorbed through skin into systemic circulation at detectable levels. Exhibits estrogenic, anti-androgenic, and anti-thyroid activity in vitro and in animal studies. Causes coral bleaching by promoting viral infections in zooxanthellae.'
);

-- 48. Phenoxyethanol
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000048',
    'Phenoxyethanol', '122-99-6', NULL, 'Phenoxyethanol',
    'low', 'not_evaluated', 'moderate',
    TRUE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Preservative marketed as a paraben alternative. Generally safe at permitted levels (up to 1% in EU). Can cause skin irritation in sensitive individuals. Japan has restricted its use.',
    'Glycol ether that disrupts bacterial cell membranes. Low systemic toxicity in adults. Concern for infants: case reports of CNS depression and vomiting in neonates exposed to high concentrations. EU limits to 1% in all product types.'
);


-- ──────────────────────────────────────────────────────────────
-- SECTION F: PERSONAL CARE (30)
-- ──────────────────────────────────────────────────────────────

-- 30. Sodium Fluoride
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000030',
    'Sodium Fluoride', '7681-49-4', NULL, 'Sodium Fluoride',
    'low', 'not_evaluated', 'high',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, TRUE,
    'Essential for preventing tooth decay at toothpaste concentrations. Toxic if swallowed in large amounts — especially dangerous for young children. Bioaccumulates in bones and teeth.',
    'Strengthens enamel by forming fluorapatite. Toxic dose ~5 mg/kg body weight. Chronic excess causes dental fluorosis (mottled teeth) and skeletal fluorosis (bone/joint damage). Inhibits enolase and other enzymes at toxic doses.'
);


-- ──────────────────────────────────────────────────────────────
-- SECTION G: CLEANING PRODUCTS (31–34)
-- ──────────────────────────────────────────────────────────────

-- 31. Chloroxylenol (PCMX)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000031',
    'Chloroxylenol', '88-04-0', NULL, 'Chloroxylenol',
    'moderate', 'not_evaluated', 'moderate',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Active antiseptic in Dettol. Safe for external use at low concentrations (4.8% in Dettol). Highly toxic if ingested — causes corrosive injury to mouth, throat, and GI tract.',
    'Disrupts microbial cell membranes. Ingestion causes corrosive burns, CNS depression, hepatotoxicity, and renal failure. Dettol poisoning is a recognized clinical entity in India and Southeast Asia. Dermal toxicity is low at antiseptic concentrations.'
);

-- 32. Sodium Tripolyphosphate (STPP)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000032',
    'Sodium Tripolyphosphate', '7758-29-4', '451i', NULL,
    'low', 'not_evaluated', 'moderate',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Detergent builder that softens water and removes grease. Low direct human toxicity but causes skin and eye irritation. Major environmental pollutant — promotes algal blooms in waterways.',
    'Sequesters calcium and magnesium ions to soften water. Irritates skin and eyes by defatting and raising local pH. Environmental concern: phosphate runoff causes eutrophication, leading to algal blooms and aquatic dead zones.'
);

-- 33. Sodium Hypochlorite
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000033',
    'Sodium Hypochlorite', '7681-52-9', NULL, NULL,
    'high', 'not_evaluated', 'high',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Active ingredient in bleach. Causes severe chemical burns to skin and eyes at household concentrations. Releases toxic chlorine gas when mixed with acids or ammonia — a common household poisoning scenario.',
    'Strong oxidizer that destroys cell membranes and denatures proteins on contact. Reacts with HCl (acidic cleaners) to release Cl2 gas, and with ammonia to form toxic chloramine gases. Ingestion causes esophageal and gastric necrosis.'
);

-- 34. Linear Alkylbenzene Sulfonate (LAS)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000034',
    'Linear Alkylbenzene Sulfonate', '68411-30-3', NULL, NULL,
    'low', 'not_evaluated', 'moderate',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Most widely used surfactant in Indian detergents. Moderate skin irritant that can cause dermatitis with prolonged contact. Biodegradable and low aquatic toxicity compared to older surfactants.',
    'Anionic surfactant that disrupts lipid bilayers. Causes irritant contact dermatitis with prolonged or repeated exposure. Readily biodegradable (>99% in wastewater treatment). Low systemic toxicity via dermal or oral route at typical use levels.'
);


-- ──────────────────────────────────────────────────────────────
-- SECTION H: MULTI-CATEGORY INGREDIENTS (35–42, 45–46)
-- ──────────────────────────────────────────────────────────────

-- 35. Talc
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000035',
    'Talc', '14807-96-6', NULL, 'Talc',
    'moderate', 'group_2b', 'moderate',
    FALSE, FALSE, FALSE, TRUE,
    FALSE, FALSE,
    'Mineral powder classified as possibly carcinogenic when used perineally (IARC Group 2B). Can be contaminated with asbestos from natural deposits. Johnson & Johnson faced major lawsuits over talc in baby powder.',
    'Perineal use may allow particle migration to ovaries, causing chronic inflammation and potentially ovarian cancer. Asbestos contamination (from geological co-occurrence) is the primary carcinogenic concern. Inhalation of talc dust causes pulmonary talcosis.'
);

-- 36. Titanium Dioxide
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000036',
    'Titanium Dioxide', '13463-67-7', '171', 'CI 77891',
    'moderate', 'group_2b', 'high',
    FALSE, TRUE, FALSE, FALSE,
    FALSE, FALSE,
    'White pigment classified as possibly carcinogenic when inhaled (IARC Group 2B). Banned as a food additive (E171) in the EU since 2022 due to genotoxicity concerns. Still permitted by FSSAI.',
    'Nanoparticles can cross the GI epithelium and accumulate in Peyer patches (gut lymphoid tissue). EFSA concluded it can no longer be considered safe as a food additive due to genotoxicity concerns (2021). Inhalation causes lung inflammation and tumors in rats.'
);

-- 37. Aluminum Chlorohydrate
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000037',
    'Aluminum Chlorohydrate', '1327-41-9', NULL, 'Aluminum Chlorohydrate',
    'low', 'not_evaluated', 'low',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Active ingredient in most antiperspirants. Concerns about breast cancer and Alzheimer links are not supported by current evidence, but research is ongoing and inconclusive.',
    'Blocks eccrine sweat glands by forming a gel plug with mucopolysaccharides. Aluminum is absorbed in very small amounts through intact skin. Hypothesized but unproven links to breast cancer (estrogen-like effects) and Alzheimer disease (aluminum in brain plaques).'
);

-- 38. Formaldehyde
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000038',
    'Formaldehyde', '50-00-0', NULL, 'Formaldehyde',
    'critical', 'group_1', 'high',
    TRUE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Known human carcinogen (IARC Group 1). Causes nasopharyngeal cancer and myeloid leukemia. Strong skin sensitizer and respiratory irritant. Found in some hair straighteners and as a preservative.',
    'Reacts with DNA and proteins via electrophilic addition, forming DNA-protein cross-links. Causes mutations and chromosomal damage. Chronic inhalation exposure causes squamous cell carcinoma of the nasopharynx. Also causes myeloid leukemia via bone marrow toxicity.'
);

-- 39. Fragrance (Parfum)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000039',
    'Fragrance', NULL, NULL, 'Parfum',
    'moderate', 'not_evaluated', 'low',
    FALSE, FALSE, TRUE, FALSE,
    NULL, NULL,
    'Umbrella term hiding up to 3,000+ undisclosed chemicals. Leading cause of allergic contact dermatitis from cosmetics. May contain phthalates, synthetic musks, and other endocrine disruptors.',
    'Not a single chemical — manufacturers are not required to disclose individual fragrance components (trade secret protection). Common allergens include limonene, linalool, coumarin, and cinnamal. Some synthetic musks bioaccumulate and are detected in breast milk.'
);

-- 40. Dimethicone
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000040',
    'Dimethicone', '9006-65-9', NULL, 'Dimethicone',
    'safe', 'not_evaluated', 'high',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Silicone-based polymer that forms a smooth protective barrier on skin and hair. Non-toxic, non-irritating, and not absorbed into the body. Environmental concern: not readily biodegradable.',
    'Inert polydimethylsiloxane too large to penetrate skin or be absorbed. No systemic toxicity. Does not interact with biological systems. Environmental persistence in soil and waterways is the primary concern, not human health.'
);

-- 41. Triethanolamine (TEA)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000041',
    'Triethanolamine', '102-71-6', NULL, 'TEA',
    'moderate', 'not_evaluated', 'moderate',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'pH adjuster that can react with nitrosating agents to form carcinogenic nitrosamines. Can cause allergic reactions and skin irritation. EU restricts its concentration in cosmetics to 2.5%.',
    'Reacts with N-nitrosating agents to form NDELA (N-nitrosodiethanolamine), a carcinogenic nitrosamine. EU prohibits use in products containing nitrosating agents. Penetrates skin more readily at higher pH and concentrations.'
);

-- 42. Polyethylene Glycol (PEG)
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000042',
    'Polyethylene Glycol', '25322-68-3', NULL, 'PEG',
    'low', 'not_evaluated', 'moderate',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Synthetic polymer used as thickener and moisture carrier. PEG itself is low-toxicity, but can be contaminated with ethylene oxide (carcinogen) and 1,4-dioxane from the manufacturing process.',
    'Ethoxylation process can leave residual ethylene oxide (IARC Group 1) and 1,4-dioxane (IARC Group 2B). PEGs also enhance skin penetration of other ingredients, potentially increasing absorption of harmful co-ingredients. The PEG molecule itself is not significantly toxic.'
);

-- 45. Sodium Hydroxide
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000045',
    'Sodium Hydroxide', '1310-73-2', '524', NULL,
    'moderate', 'not_evaluated', 'high',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Strong alkali (lye) used to adjust pH. Causes severe chemical burns on direct contact. Safe in finished cosmetic products where it has reacted with other ingredients and is fully neutralized.',
    'Extremely alkaline (pH 13-14 in solution). Causes liquefactive necrosis of skin, eyes, and mucous membranes on contact. In finished products (e.g., soap, cream), it has reacted with fatty acids and is no longer caustic. Danger is from raw/concentrated form only.'
);

-- 46. Cocamidopropyl Betaine
INSERT INTO ingredients (
    id, canonical_name, cas_number, ins_number, inci_name,
    harm_level, carcinogen_class, evidence_quality,
    is_preservative, is_colorant, is_fragrance, is_natural,
    endocrine_disruptor, bioaccumulation,
    description, mechanism_of_harm
) VALUES (
    'a0000000-0000-4000-a000-000000000046',
    'Cocamidopropyl Betaine', '61789-40-0', NULL, 'Cocamidopropyl Betaine',
    'low', 'not_evaluated', 'moderate',
    FALSE, FALSE, FALSE, FALSE,
    FALSE, FALSE,
    'Mild coconut-derived surfactant. Generally well-tolerated but named "Allergen of the Year" (2004) by the American Contact Dermatitis Society due to sensitization from manufacturing impurities.',
    'Sensitization is likely caused by impurities from synthesis (amidoamine and dimethylaminopropylamine) rather than the betaine itself. Can cause eyelid dermatitis and periorbital contact allergy. The purified compound has very low irritation potential.'
);


-- ══════════════════════════════════════════════════════════════
-- ORGAN TARGETS
-- ══════════════════════════════════════════════════════════════

-- ── Parabens (1-3): endocrine, reproductive, skin ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000001', 'endocrine', 'Weak estrogenic activity; binds estrogen receptors', 'low', 'dermal', TRUE, 'moderate'),
('a0000000-0000-4000-a000-000000000001', 'reproductive', 'Detected in breast tissue; reproductive effects debated', 'low', 'dermal', TRUE, 'low'),
('a0000000-0000-4000-a000-000000000001', 'skin', 'Contact sensitization in some individuals', 'low', 'dermal', FALSE, 'moderate'),
('a0000000-0000-4000-a000-000000000002', 'endocrine', 'Stronger estrogenic activity than methylparaben', 'moderate', 'dermal', TRUE, 'moderate'),
('a0000000-0000-4000-a000-000000000002', 'reproductive', 'Reduced sperm counts and testosterone in animal studies', 'moderate', 'dermal', TRUE, 'moderate'),
('a0000000-0000-4000-a000-000000000003', 'endocrine', 'Strongest estrogenic paraben; anti-androgenic effects', 'moderate', 'dermal', TRUE, 'moderate'),
('a0000000-0000-4000-a000-000000000003', 'reproductive', 'Affects male reproductive development in rodents', 'moderate', 'dermal', TRUE, 'moderate');

-- ── Sodium Benzoate (4): gastrointestinal, nervous ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000004', 'gastrointestinal', 'Benzene formation with ascorbic acid in acidic conditions', 'low', 'oral', TRUE, 'high'),
('a0000000-0000-4000-a000-000000000004', 'nervous', 'Linked to hyperactivity in children (with azo dyes)', 'low', 'oral', TRUE, 'high');

-- ── DMDM Hydantoin (6) & Imidazolidinyl Urea (7): skin, respiratory, immune ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000006', 'skin', 'Allergic contact dermatitis from released formaldehyde', 'high', 'dermal', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000006', 'respiratory', 'Formaldehyde inhalation irritates airways', 'moderate', 'inhalation', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000006', 'immune', 'Skin sensitization via hapten formation', 'moderate', 'dermal', TRUE, 'high'),
('a0000000-0000-4000-a000-000000000007', 'skin', 'One of most common cosmetic contact allergens', 'high', 'dermal', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000007', 'respiratory', 'Formaldehyde inhalation irritates airways', 'moderate', 'inhalation', FALSE, 'high');

-- ── BHA (8): liver, endocrine, gastrointestinal ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000008', 'gastrointestinal', 'Forestomach tumors in rodents (species relevance debated)', 'moderate', 'oral', TRUE, 'moderate'),
('a0000000-0000-4000-a000-000000000008', 'endocrine', 'Estrogenic and anti-androgenic activity', 'moderate', 'oral', TRUE, 'moderate'),
('a0000000-0000-4000-a000-000000000008', 'liver', 'Hepatic enzyme induction at high doses', 'low', 'oral', TRUE, 'moderate');

-- ── BHT (9): liver ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000009', 'liver', 'Hepatic hypertrophy and enzyme induction at high doses', 'low', 'oral', TRUE, 'moderate');

-- ── SLS (10): skin, eyes ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000010', 'skin', 'Strips lipid barrier; causes irritant contact dermatitis', 'moderate', 'dermal', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000010', 'eyes', 'Severe eye irritant at concentrations >1%', 'moderate', 'ocular', FALSE, 'high');

-- ── SLES (11): skin, eyes ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000011', 'skin', 'Mild skin irritation; less severe than SLS', 'low', 'dermal', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000011', 'eyes', 'Eye irritant but milder than SLS', 'low', 'ocular', FALSE, 'high');

-- ── Azo Dyes (12-15, 17): nervous, immune ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000012', 'nervous', 'Linked to hyperactivity and attention problems in children', 'moderate', 'oral', TRUE, 'high'),
('a0000000-0000-4000-a000-000000000012', 'immune', 'Triggers allergic/pseudoallergic reactions; cross-reacts with aspirin', 'moderate', 'oral', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000012', 'respiratory', 'Can trigger asthma in aspirin-sensitive individuals', 'moderate', 'oral', FALSE, 'moderate'),
('a0000000-0000-4000-a000-000000000013', 'nervous', 'Linked to hyperactivity in children (Southampton study)', 'moderate', 'oral', TRUE, 'high'),
('a0000000-0000-4000-a000-000000000013', 'immune', 'Can cause urticaria and rhinitis in sensitive individuals', 'low', 'oral', FALSE, 'moderate'),
('a0000000-0000-4000-a000-000000000014', 'nervous', 'Linked to hyperactivity in children', 'moderate', 'oral', TRUE, 'moderate'),
('a0000000-0000-4000-a000-000000000014', 'immune', 'Allergic reactions in sensitive individuals', 'moderate', 'oral', FALSE, 'moderate'),
('a0000000-0000-4000-a000-000000000015', 'nervous', 'Linked to hyperactivity in children', 'moderate', 'oral', TRUE, 'moderate'),
('a0000000-0000-4000-a000-000000000015', 'gastrointestinal', 'Effects on gut microbiome and intestinal barrier in animal studies', 'low', 'oral', TRUE, 'low'),
('a0000000-0000-4000-a000-000000000017', 'nervous', 'Linked to hyperactivity in children', 'moderate', 'oral', TRUE, 'moderate'),
('a0000000-0000-4000-a000-000000000017', 'immune', 'Pseudoallergic reactions in sensitive individuals', 'moderate', 'oral', FALSE, 'moderate');

-- ── Brilliant Blue (16): immune ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000016', 'immune', 'Rare IgE-mediated allergic reactions', 'low', 'oral', FALSE, 'moderate');

-- ── Aspartame (19): nervous ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000019', 'liver', 'Limited evidence of hepatocellular effects (basis for IARC 2B)', 'low', 'oral', TRUE, 'low');

-- ── TBHQ (20): gastrointestinal, immune ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000020', 'gastrointestinal', 'Nausea, vomiting at doses above 1g', 'moderate', 'oral', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000020', 'immune', 'May affect T-cell and NK-cell function in vitro', 'low', 'oral', TRUE, 'low');

-- ── Phosphoric Acid (21): bones/teeth ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000021', 'skin', 'Tooth enamel erosion from chronic acidic exposure', 'low', 'oral', TRUE, 'moderate'),
('a0000000-0000-4000-a000-000000000021', 'cardiovascular', 'May affect calcium-phosphorus balance and bone health', 'low', 'oral', TRUE, 'low');

-- ── Hydroquinone (23): skin, liver, kidney ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000023', 'skin', 'Exogenous ochronosis (irreversible darkening); contact dermatitis', 'critical', 'dermal', TRUE, 'high'),
('a0000000-0000-4000-a000-000000000023', 'kidney', 'Nephrotoxicity from reactive quinone metabolites', 'high', 'dermal', TRUE, 'moderate'),
('a0000000-0000-4000-a000-000000000023', 'liver', 'Hepatotoxicity from quinone intermediates', 'high', 'dermal', TRUE, 'moderate');

-- ── Triclosan (25): endocrine, immune, cardiovascular ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000025', 'endocrine', 'Disrupts thyroid hormone homeostasis', 'high', 'dermal', TRUE, 'high'),
('a0000000-0000-4000-a000-000000000025', 'reproductive', 'Anti-androgenic effects in animal studies', 'moderate', 'dermal', TRUE, 'moderate'),
('a0000000-0000-4000-a000-000000000025', 'cardiovascular', 'Impairs cardiac and skeletal muscle function in mice', 'moderate', 'dermal', TRUE, 'low'),
('a0000000-0000-4000-a000-000000000025', 'immune', 'Promotes antibiotic cross-resistance', 'high', 'dermal', TRUE, 'high');

-- ── DEA (26): liver, kidney ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000026', 'liver', 'Liver tumors in mice from topical application', 'moderate', 'dermal', TRUE, 'moderate'),
('a0000000-0000-4000-a000-000000000026', 'kidney', 'Kidney effects observed in animal studies', 'moderate', 'dermal', TRUE, 'low');

-- ── Sodium Fluoride (30): nervous, gastrointestinal, bones ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000030', 'gastrointestinal', 'Nausea, vomiting if swallowed (especially children)', 'moderate', 'oral', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000030', 'nervous', 'Neurotoxicity concerns at high chronic systemic exposure', 'low', 'oral', TRUE, 'low');

-- ── Chloroxylenol (31): liver, kidney, gastrointestinal, nervous ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000031', 'gastrointestinal', 'Corrosive burns if ingested', 'critical', 'oral', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000031', 'liver', 'Hepatotoxicity from ingestion', 'high', 'oral', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000031', 'kidney', 'Renal failure from ingestion', 'high', 'oral', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000031', 'nervous', 'CNS depression from ingestion', 'high', 'oral', FALSE, 'high');

-- ── Sodium Hypochlorite (33): skin, eyes, respiratory, gastrointestinal ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000033', 'skin', 'Chemical burns at household concentrations', 'high', 'dermal', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000033', 'eyes', 'Severe corneal damage on contact', 'critical', 'ocular', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000033', 'respiratory', 'Toxic chlorine/chloramine gas if mixed with acids or ammonia', 'critical', 'inhalation', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000033', 'gastrointestinal', 'Esophageal and gastric necrosis if ingested', 'critical', 'oral', FALSE, 'high');

-- ── Talc (35): respiratory, reproductive ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000035', 'respiratory', 'Pulmonary talcosis from chronic inhalation', 'moderate', 'inhalation', TRUE, 'high'),
('a0000000-0000-4000-a000-000000000035', 'reproductive', 'Possibly carcinogenic for ovarian cancer with perineal use', 'moderate', 'dermal', TRUE, 'low');

-- ── Titanium Dioxide (36): gastrointestinal, respiratory ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000036', 'gastrointestinal', 'Nanoparticles accumulate in gut lymphoid tissue; genotoxicity concern', 'moderate', 'oral', TRUE, 'moderate'),
('a0000000-0000-4000-a000-000000000036', 'respiratory', 'Lung inflammation and tumors in rats from inhalation', 'moderate', 'inhalation', TRUE, 'high');

-- ── Formaldehyde (38): respiratory, skin, immune ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000038', 'respiratory', 'Nasopharyngeal cancer from chronic inhalation', 'critical', 'inhalation', TRUE, 'high'),
('a0000000-0000-4000-a000-000000000038', 'skin', 'Strong contact sensitizer; causes dermatitis', 'high', 'dermal', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000038', 'immune', 'Myeloid leukemia from chronic exposure', 'critical', 'inhalation', TRUE, 'high');

-- ── Fragrance (39): skin, respiratory ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000039', 'skin', 'Leading cause of cosmetic contact dermatitis', 'moderate', 'dermal', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000039', 'respiratory', 'Can trigger asthma and respiratory irritation', 'moderate', 'inhalation', FALSE, 'moderate');

-- ── TEA (41): liver ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000041', 'liver', 'Nitrosamine formation risk; liver concern from NDELA', 'moderate', 'dermal', TRUE, 'moderate');

-- ── Sodium Nitrite (44): gastrointestinal ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000044', 'gastrointestinal', 'Nitrosamine formation in stomach; GI cancer risk', 'moderate', 'oral', TRUE, 'high');

-- ── Oxybenzone (47): endocrine, reproductive ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000047', 'endocrine', 'Estrogenic, anti-androgenic, and anti-thyroid activity', 'moderate', 'dermal', TRUE, 'moderate'),
('a0000000-0000-4000-a000-000000000047', 'reproductive', 'Detected in breast milk; reproductive effects in animal studies', 'moderate', 'dermal', TRUE, 'low');

-- ── Sodium Metabisulfite (49): respiratory, skin ──
INSERT INTO ingredient_organ_targets (ingredient_id, organ_system, effect_description, severity, exposure_route, is_chronic, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000049', 'respiratory', 'Severe bronchospasm in sulfite-sensitive asthmatics', 'high', 'oral', FALSE, 'high'),
('a0000000-0000-4000-a000-000000000049', 'skin', 'Contact urticaria in sensitive individuals', 'moderate', 'dermal', FALSE, 'moderate'),
('a0000000-0000-4000-a000-000000000049', 'gastrointestinal', 'GI distress including nausea and diarrhea', 'low', 'oral', FALSE, 'moderate');


-- ══════════════════════════════════════════════════════════════
-- VULNERABLE POPULATIONS
-- ══════════════════════════════════════════════════════════════

-- ── Parabens (1-3): pregnant, infants, children ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000001', 'pregnant', 1.5, 'Estrogenic activity may affect fetal development', 'low'),
('a0000000-0000-4000-a000-000000000001', 'infants', 2.0, 'Immature metabolic capacity; higher surface-area-to-weight ratio', 'moderate'),
('a0000000-0000-4000-a000-000000000002', 'pregnant', 2.0, 'Stronger estrogenic potency; reproductive concern', 'moderate'),
('a0000000-0000-4000-a000-000000000002', 'infants', 2.5, 'EU bans in leave-on products for children under 3', 'high'),
('a0000000-0000-4000-a000-000000000002', 'children', 1.8, 'Developing endocrine system more susceptible', 'moderate'),
('a0000000-0000-4000-a000-000000000003', 'pregnant', 2.0, 'Anti-androgenic effects may affect fetal development', 'moderate'),
('a0000000-0000-4000-a000-000000000003', 'infants', 2.5, 'Banned in products for children under 3 in several EU countries', 'high'),
('a0000000-0000-4000-a000-000000000003', 'children', 2.0, 'Developing reproductive system at higher risk', 'moderate');

-- ── Azo Dyes (12-15, 17): children ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000012', 'children', 2.0, 'Linked to hyperactivity and attention problems in children', 'high'),
('a0000000-0000-4000-a000-000000000012', 'asthmatic', 2.0, 'Cross-reactivity with aspirin sensitivity; can trigger asthma', 'high'),
('a0000000-0000-4000-a000-000000000013', 'children', 2.0, 'Southampton study linked to childhood hyperactivity', 'high'),
('a0000000-0000-4000-a000-000000000014', 'children', 2.0, 'Linked to hyperactivity in children', 'moderate'),
('a0000000-0000-4000-a000-000000000015', 'children', 2.0, 'Linked to hyperactivity in children', 'moderate'),
('a0000000-0000-4000-a000-000000000017', 'children', 2.0, 'Linked to hyperactivity in children', 'moderate');

-- ── Sodium Benzoate (4): children ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000004', 'children', 1.5, 'Hyperactivity link when combined with azo dyes', 'high');

-- ── Formaldehyde releasers (6-7): pregnant, children, eczema ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000006', 'pregnant', 1.5, 'Formaldehyde is a teratogen at high doses in animals', 'low'),
('a0000000-0000-4000-a000-000000000006', 'children', 1.5, 'Higher skin surface area to body weight ratio', 'moderate'),
('a0000000-0000-4000-a000-000000000006', 'eczema', 2.0, 'Compromised skin barrier increases absorption and sensitization', 'high'),
('a0000000-0000-4000-a000-000000000007', 'pregnant', 1.5, 'Formaldehyde exposure concern during pregnancy', 'low'),
('a0000000-0000-4000-a000-000000000007', 'children', 1.5, 'Higher relative exposure due to body size', 'moderate'),
('a0000000-0000-4000-a000-000000000007', 'eczema', 2.0, 'Compromised skin barrier increases sensitization risk', 'high');

-- ── SLS (10): eczema ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000010', 'eczema', 2.5, 'Severely aggravates compromised skin barrier', 'high'),
('a0000000-0000-4000-a000-000000000010', 'children', 1.3, 'Thinner stratum corneum; more susceptible to irritation', 'moderate');

-- ── Aspartame (19): PKU ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000019', 'g6pd_deficient', 1.0, 'No specific risk for G6PD deficiency', 'high');
-- Note: PKU (phenylketonuria) is the key vulnerability but not in our enum.
-- Storing as a note in the description field instead.

-- ── Hydroquinone (23): pregnant, children ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000023', 'pregnant', 3.0, 'Potential teratogenic effects; significant systemic absorption through skin', 'moderate'),
('a0000000-0000-4000-a000-000000000023', 'children', 3.0, 'Higher surface-area-to-weight ratio amplifies systemic exposure', 'moderate');

-- ── Triclosan (25): pregnant, infants ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000025', 'pregnant', 2.0, 'Thyroid disruption may affect fetal neurodevelopment', 'moderate'),
('a0000000-0000-4000-a000-000000000025', 'infants', 2.5, 'Developing endocrine system highly susceptible to thyroid disruption', 'moderate');

-- ── Sodium Fluoride (30): children ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000030', 'children', 3.0, 'Swallowing toothpaste can cause fluorosis; potentially toxic dose is much lower for small children', 'high'),
('a0000000-0000-4000-a000-000000000030', 'infants', 3.5, 'Very low toxic threshold; developing teeth susceptible to fluorosis', 'high');

-- ── Formaldehyde (38): pregnant, children, asthmatic ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000038', 'pregnant', 2.5, 'Potential teratogenic effects; occupational studies show increased risk', 'moderate'),
('a0000000-0000-4000-a000-000000000038', 'children', 2.0, 'Developing respiratory system more vulnerable; higher breathing rate', 'moderate'),
('a0000000-0000-4000-a000-000000000038', 'asthmatic', 3.0, 'Potent respiratory irritant that can trigger severe asthma attacks', 'high');

-- ── Talc (35): infants ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000035', 'infants', 2.5, 'Inhalation risk during diaper changes; can cause respiratory distress', 'high');

-- ── Sodium Metabisulfite (49): asthmatic ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000049', 'asthmatic', 3.0, 'Triggers severe bronchospasm in 5-10% of asthmatics', 'high'),
('a0000000-0000-4000-a000-000000000049', 'children', 1.5, 'Children with asthma at higher risk of sulfite sensitivity', 'moderate');

-- ── Oxybenzone (47): pregnant, children ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000047', 'pregnant', 2.0, 'Endocrine disruption; detected in amniotic fluid', 'low'),
('a0000000-0000-4000-a000-000000000047', 'children', 1.8, 'Developing endocrine system more susceptible; higher skin absorption', 'moderate');

-- ── Phenoxyethanol (48): infants ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000048', 'infants', 2.5, 'Case reports of CNS depression and vomiting in neonates; immature metabolism', 'moderate');

-- ── Sodium Nitrite (44): infants, pregnant ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000044', 'infants', 3.0, 'High risk of methemoglobinemia (blue baby syndrome) due to immature enzyme system', 'high'),
('a0000000-0000-4000-a000-000000000044', 'pregnant', 1.5, 'Nitrosamine exposure concern during pregnancy', 'moderate');

-- ── Sodium Hypochlorite (33): asthmatic, children ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000033', 'asthmatic', 2.5, 'Chlorine fumes trigger severe bronchospasm', 'high'),
('a0000000-0000-4000-a000-000000000033', 'children', 2.0, 'Accidental ingestion risk; lower toxic threshold due to body weight', 'high');

-- ── Chloroxylenol (31): children ──
INSERT INTO ingredient_vulnerabilities (ingredient_id, population_group, risk_multiplier, explanation, evidence_quality) VALUES
('a0000000-0000-4000-a000-000000000031', 'children', 2.5, 'Accidental Dettol ingestion is a common pediatric poisoning in India', 'high');


COMMIT;

-- ============================================================
-- SEED COMPLETE: 50 ingredients, ~80 organ targets, ~55 vulnerabilities
-- ============================================================

-- ============================================================
-- ANTIGRAVITY MVP — STEP 4: SEED TARGET PRODUCTS (50 TOTAL)
-- 20 Food, 10 Skincare, 10 Personal Care, 10 Cleaning
-- ============================================================

BEGIN;

-- ──────────────────────────────────────────────────────────────
-- 1. FOOD PRODUCTS (20)
-- ──────────────────────────────────────────────────────────────

-- 1. Maggi 2-Minute Noodles
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000001', 'Maggi 2-Minute Noodles (Masala)', 'Maggi', '8901058851113', 'instant_noodles',
 'Noodles: Refined wheat flour (Maida), Palm oil, Salt, Wheat gluten, Mineral (Calcium carbonate), Thickeners (508, 412), Acidity regulators (501(i), 500(i), 330). Masala Noodle Powder Maker: Hydrolysed groundnut protein, Mixed spices (Dehydrated onion, Coriander powder, Chilli powder, Turmeric powder, Garlic powder, Cumin powder, Aniseed, Ginger powder, Black pepper powder, Fenugreek powder, Nutmeg, Clove), Noodle powder, Sugar, Starch, Edible starch, Salt, Palm oil, Acidity regulator (330), Mineral (Ferric pyrophosphate), Flavour enhancer (635), Colour (150d).');

-- 2. Parle-G Biscuits
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000002', 'Parle-G Biscuits', 'Parle', '8901725133800', 'biscuits',
 'Refined Wheat Flour (Maida) (67%), Sugar, Edible Vegetable Oil (Palm Oil), Invert Sugar Syrup, Raising Agents (503(ii), 500(ii)), Salt, Milk Solids, Emulsifier (322 or 471), Dough Conditioner (223).');

-- 3. Britannia Good Day
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000003', 'Britannia Good Day Cashew Cookies', 'Britannia', '8901063014106', 'biscuits',
 'Refined Wheat Flour (Maida), Sugar, Edible Vegetable Oil (Palm), Cashew Bits (4.5%), Butter, Invert Sugar Syrup, Milk Solids, Raising Agents (503(ii), 500(ii)), Iodised Salt, Emulsifiers (322, 471, 472e), Nature Identical Flavouring Substances.');

-- 4. Lay's Classic Salted
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000004', 'Lay''s Classic Salted Potato Chips', 'Lay''s', '8901491001021', 'snacks',
 'Potato, Edible Vegetable Oil (Sunflower, Palmolein oil), Iodised Salt, Antioxidant (307b, 319).');

-- 5. Kurkure Masala Munch
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000005', 'Kurkure Masala Munch', 'Kurkure', '8901491361026', 'snacks',
 'Cereal Products (61%) (Rice Meal (42%), Corn Meal (19%)), Edible Vegetable Oil (Palmolein, Sesame oil), Seasoning (Spices and condiments, Iodised salt, Maltodextrin, Sugar, Black salt, Acidity regulators (330, 296, 334), Tomato powder, Hydrolysed soy protein, Flavour (Natural and nature identical flavouring substances), Dextrose, Emulsifier (414), Milk solids, Edible starch, Flavour enhancers (627, 631)), Gram Meal (3%).');

-- 6. Haldiram's Bhujia
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000006', 'Haldiram''s Nagpur Sev Bhujia', 'Haldiram''s', '8904063200021', 'snacks',
 'Moth Pulse Flour (47%), Edible Vegetable Oil (Cotton Seed, Corn & Palmolein Oil), Bengal Gram Flour (9%), Iodised Salt, Mixed Spices (Chilli Powder, Black Pepper Powder, Ginger Powder, Cardamom Powder, Clove Powder, Nutmeg Powder).');

-- 7. Bournvita
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000007', 'Cadbury Bournvita Shakti', 'Cadbury', '7622202026683', 'breakfast_drink',
 'Cereal Extract 56% (Barley, Millets, Wheat), Sugar, Cocoa Solids, Maltodextrin, Colour (150c), Minerals, Wheat Gluten, Liquid Glucose, Emulsifiers (322, 471), Milk Solids, Vitamins, Raising Agent (500(ii)), Flavours (Natural, Nature Identical and Artificial (Vanilla) Flavouring Substances), Iodised Salt.');

-- 8. Horlicks
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000008', 'Horlicks Classic Malt', 'Horlicks', '8901030784217', 'breakfast_drink',
 'Malted Barley (39%), Wheat Flour (Maida) (27%), Sugar, Milk Solids (14%), Minerals, Wheat Gluten, Emulsifier (INS 471), Salt, Acidity Regulators (INS 501(ii), INS 500(ii)), Vitamins, Nature Identical Flavouring Substances.');

-- 9. Boost
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000009', 'Boost Health Drink', 'Boost', '8901030777123', 'breakfast_drink',
 'Cereal Extract (44%) (Malted Barley, Wheat), Sugar, Wheat Flour (Maida), Cocoa Powder, Milk Solids, Minerals, Colour (INS 150c), Emulsifier (INS 471), Salt, Vitamins, Acidity Regulators (INS 501(ii), INS 500(ii)), Nature Identical Flavouring Substances.');

-- 10. Milo
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000010', 'Nestle Milo', 'Nestle', '8901058863413', 'breakfast_drink',
 'Protomalt Malt Extract (Malted Barley, Tapioca Starch), Skimmed Milk Powder, Sugar, Cocoa Powder, Palm Oil, Minerals, Vitamins, Acidity Regulator (INS 500(ii)).');

-- 11. Amul Butter
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000011', 'Amul Pasteurised Butter', 'Amul', '8901262010059', 'dairy',
 'Butter (Milk Fat 80%), Common Salt, Permitted Natural Colour (INS 160a(i)).');

-- 12. Amul Cheese Slices
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000012', 'Amul Processed Cheese Slices', 'Amul', '8901262020089', 'dairy',
 'Milk Solids, Cheese, Common Salt, Emulsifiers (INS 331, INS 339), Preservative (INS 200, INS 202), Acidity Regulator (INS 330).');

-- 13. Kissan Mixed Fruit Jam
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000013', 'Kissan Mixed Fruit Jam', 'Kissan', '8901030342110', 'condiments',
 'Sugar, Mixed Fruit Pulp (46%) (Banana, Papaya, Apple, Pear, Pineapple, Mango, Grape, Orange), Thickener (INS 440), Acidity Regulator (INS 330), Preservative (INS 211), Synthetic Food Colours (INS 122, INS 102, INS 133).');

-- 14. Heinz Tomato Ketchup
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000014', 'Heinz Tomato Ketchup', 'Heinz', '8901058000122', 'condiments',
 'Tomato Paste (28%), Water, Sugar, Distilled Vinegar, Salt, Spices, Onion Powder, Garlic Powder, Natural Flavour.');

-- 15. Knorr Chicken Soup
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000015', 'Knorr International Chicken Delite Soup', 'Knorr', '8901030561234', 'condiments',
 'Refined Wheat Flour (Maida), Maize Starch, Sugar, Salt, Dehydrated Chicken Bits (4%), Dehydrated Vegetables (Onion, Garlic), Palm Oil, Hydrolyzed Vegetable Protein, Thickener (INS 415), Flavour Enhancers (INS 627, INS 631), Acidity Regulator (INS 330).');

-- 16. Sunfeast Dark Fantasy
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000016', 'Sunfeast Dark Fantasy Choco Fills', 'Sunfeast', '8901725111228', 'biscuits',
 'Choco Cream (40%) [Sugar, Refined Palm Oil, Cocoa Solids, Emulsifier (INS 322)], Refined Wheat Flour (Maida), Hydrogenated Vegetable Oil, Sugar, Invert Sugar Syrup, Cocoa Solids, Raising Agents (INS 503(ii), INS 500(ii)), Emulsifiers (INS 322, INS 471), Salt.');

-- 17. Hide & Seek
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000017', 'Parle Hide & Seek Chocolate Chip Cookies', 'Parle', '8901725181108', 'biscuits',
 'Refined Wheat Flour (Maida), Sugar, Chocolate Chips (20%) [Sugar, Cocoa Solids, Cocoa Butter, Emulsifier (322), Artificial Flavour (Vanilla)], Edible Vegetable Oil (Palm Oil), Cocoa Solids, Invert Sugar Syrup, Raising Agents (503(ii), 500(ii)), Salt, Emulsifier (322).');

-- 18. Real Fruit Juice (Mixed Fruit)
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000018', 'Real Fruit Power Mixed Fruit Juice', 'Real', '8901207000123', 'juices',
 'Water, Mixed Fruit Concentrate (20%) (Orange, Apple, Guava, Mango, Pineapple, Banana, Apricot, Peach, Passion Fruit), Sugar, Acidity Regulator (INS 330), Vitamin C (Ascorbic Acid).');

-- 19. Tropicana Orange
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000019', 'Tropicana 100% Orange Juice', 'Tropicana', '8901491102213', 'juices',
 'Reconstituted Orange Juice (Water, Orange Juice Concentrate).');

-- 20. Coca-Cola (India) / Thums Up
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000020', 'Thums Up Soft Drink', 'Coca-Cola', '8901764042270', 'beverages',
 'Carbonated Water, Sugar, Acidity Regulator (338), Caffeine (8.3 mg/100 g), Colour (150d), Flavours (Natural, Nature-Identical & Artificial (Cola) Flavouring Substances).');


-- ──────────────────────────────────────────────────────────────
-- 2. SKINCARE & COSMETICS (10)
-- ──────────────────────────────────────────────────────────────

-- 21. Fair & Lovely / Glow & Lovely
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000021', 'Glow & Lovely Advanced Multivitamin Cream', 'Glow & Lovely', '8901030865732', 'fairness_cream',
 'Water, Palmitic Acid, Stearic Acid, Niacinamide, Glycerin, Isopropyl Myristate, Ethylhexyl Methoxycinnamate, Potassium Hydroxide, Cetyl Alcohol, Dimethicone, Titanium Dioxide, Phenoxyethanol, Methylparaben, Propylparaben, Sodium Ascorbyl Phosphate, Tocopheryl Acetate, Allantoin, Pyridoxine Hydrochloride, Disodium EDTA, Parfum.');

-- 22. Pond's White Beauty
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000022', 'Pond''s Bright Beauty Day Cream', 'Pond''s', '8901030752112', 'fairness_cream',
 'Water, Palmitic Acid, Stearic Acid, Niacinamide, Glycerin, Titanium Dioxide, Ethylhexyl Methoxycinnamate, Potassium Hydroxide, Cetyl Alcohol, Dimethicone, Phenoxyethanol, Parfum, Methylparaben, Propylparaben, Sodium Ascorbyl Phosphate, Tocopheryl Acetate, Disodium EDTA.');

-- 23. Nivea Soft Moisturising Cream
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000023', 'Nivea Soft Light Moisturiser', 'Nivea', '4005808890520', 'moisturizer',
 'Water, Glycerin, Paraffinum Liquidum, Myristyl Alcohol, Butylene Glycol, Alcohol Denat., Stearic Acid, Myristyl Myristate, Cera Microcristallina, Glyceryl Stearate, Hydrogenated Coco-Glycerides, Simmondsia Chinensis Seed Oil, Tocopheryl Acetate, Lanolin Alcohol (Eucerit), Polyglyceryl-2 Caprate, Dimethicone, Sodium Carbomer, Phenoxyethanol, Linalool, Citronellol, Alpha-Isomethyl Ionone, Limonene, Parfum.');

-- 24. Himalaya Neem Face Wash
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000024', 'Himalaya Purifying Neem Face Wash', 'Himalaya', '8901138500078', 'face_wash',
 'Water, Ammonium Lauryl Sulfate, Melia Azadirachta (Neem) Leaf Extract, Cocamidopropyl Betaine, Sodium Cocoyl Glutamate, Disodium Cocoyl Glutamate, Glycerin, Curcuma Longa (Turmeric) Rhizome Extract, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Sodium Hydroxide, Phenoxyethanol, Fragrance, Methylchloroisothiazolinone, Methylisothiazolinone, Disodium EDTA, CI 19140, CI 42090.');

-- 25. Neutrogena Oil-Free Moisturiser
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000025', 'Neutrogena Oil-Free Moisture (Combination Skin)', 'Neutrogena', '070501050108', 'moisturizer',
 'Water, Cetyl Ethylhexanoate, Glycerin, Cyclopentasiloxane, Polyacrylamide, Dimethicone, C13-14 Isoparaffin, Laureth-7, PEG-100 Stearate, Glyceryl Stearate, Lysine Carboxymethyl Cysteinate, Ethylhexylglycerin, Methylparaben, Propylparaben, Phenoxyethanol, Disodium EDTA.');

-- 26. Biotique Bio Honey Gel
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000026', 'Biotique Bio Honey Gel Refreshing Foaming Face Wash', 'Biotique', '8904352000123', 'face_wash',
 'Arjun Bark, Chhoti Duddhi Plant, Banhaldi Rhizome, Ritha Fruit, Honey, Purified Water Q.S.');

-- 27. Garnier Skin Naturals Light Complete
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000027', 'Garnier Skin Naturals Bright Complete Vitamin C Serum Cream', 'Garnier', '8901526002123', 'fairness_cream',
 'Water, Stearic Acid, Palmitic Acid, Glycerin, Niacinamide, Octocrylene, Isopropyl Myristate, Titanium Dioxide, Potassium Hydroxide, Cetyl Alcohol, Dimethicone, Citrus Limon Fruit Extract, Phenoxyethanol, Ethylparaben, Methylparaben, Parfum.');

-- 28. Olay Natural White
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000028', 'Olay Day Cream Natural White All In One', 'Olay', '4902430365123', 'fairness_cream',
 'Water, Niacinamide, Glycerin, Polymethylsilsesquioxane, Cyclopentasiloxane, Dimethicone, Panthenol, Tocopheryl Acetate, Titanium Dioxide, Ethylhexyl Methoxycinnamate, Polyacrylamide, C13-14 Isoparaffin, Laureth-7, Cetyl Alcohol, Stearyl Alcohol, Methylparaben, Propylparaben, Ethylparaben, Benzyl Alcohol, Fragrance.');

-- 29. Clean & Clear Foaming Face Wash
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000029', 'Clean & Clear Foaming Face Wash', 'Clean & Clear', '8901012110234', 'face_wash',
 'Water, Triethanolamine, Glycerin, Myristic Acid, Lauric Acid, Lauryl Betaine, Hydroxypropyl Methylcellulose, Cocamide DEA, Fragrance, Benzophenone-4, Disodium EDTA, Methylparaben, Propylparaben, CI 14700, CI 47005.');

-- 30. Lacto Calamine Lotion
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000030', 'Lacto Calamine Daily Nourishing Lotion (Oil Control)', 'Lacto Calamine', '8901117001234', 'lotion',
 'Water, Calamine, Light Kaolin, Glycerin, Castor Oil, Zinc Oxide, Zinc Carbonate, Emulsifying Wax, Perfume, Phenoxyethanol, Methylparaben, Propylparaben, CI 15850.');


-- ──────────────────────────────────────────────────────────────
-- 3. PERSONAL CARE (10)
-- ──────────────────────────────────────────────────────────────

-- 31. Colgate Strong Teeth
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000031', 'Colgate Strong Teeth Dental Cream Toothpaste', 'Colgate', '8901314010674', 'toothpaste',
 'Calcium Carbonate, Water, Sorbitol, Sodium Lauryl Sulfate, Hydrated Silica, Arginine, Flavor, Sodium Monofluorophosphate, Cellulose Gum, Magnesium Aluminum Silicate, Sodium Carbonate, Sodium Saccharin, Benzyl Alcohol, Sodium Silicate, Limonene, CI 77891.');

-- 32. Pepsodent Germicheck
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000032', 'Pepsodent Germicheck 8 Actions Toothpaste', 'Pepsodent', '8901030721112', 'toothpaste',
 'Calcium Carbonate, Water, Sorbitol, Hydrated Silica, Sodium Lauryl Sulfate, Flavour, Sodium Monofluorophosphate, Cellulose Gum, Potassium Citrate, Triclosan, Sodium Saccharin, Cl 77891.');

-- 33. Clinic Plus Shampoo
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000033', 'Clinic Plus Strong & Long Health Shampoo', 'Clinic Plus', '8901030700012', 'shampoo',
 'Water, Sodium Laureth Sulfate, Dimethiconol and TEA-Dodecylbenzenesulfonate, Cocamidopropyl Betaine, Sodium Chloride, Perfume, Carbomer, Guar Hydroxypropyltrimonium Chloride, Lysine Hydrochloride, Milk Protein, DMDM Hydantoin, Disodium EDTA, Citric Acid, Sodium Hydroxide, Methylchloroisothiazolinone, Methylisothiazolinone, CI 42090.');

-- 34. Head & Shoulders Anti-Dandruff
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000034', 'Head & Shoulders Smooth & Silky Anti-Dandruff Shampoo', 'Head & Shoulders', '4902430500123', 'shampoo',
 'Water, Sodium Laureth Sulfate, Sodium Xylenesulfonate, Zinc Carbonate, Cocamide MEA, Cocamidopropyl Betaine, Glycol Distearate, Sodium Chloride, Fragrance, Zinc Pyrithione, Dimethicone, Sodium Benzoate, Polyquaternium-10, Stearyl Alcohol, Magnesium Carbonate Hydroxide, Cetyl Alcohol, Methylchloroisothiazolinone, Methylisothiazolinone.');

-- 35. Pantene Pro-V
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000035', 'Pantene Pro-V Hairfall Control Shampoo', 'Pantene', '4902430400123', 'shampoo',
 'Water, Sodium Laureth Sulfate, Cocamidopropyl Betaine, Sodium Citrate, Sodium Xylenesulfonate, Sodium Chloride, Dimethiconol, Fragrance, Stearyl Alcohol, Citric Acid, Sodium Benzoate, Dimethicone, Panthenol, Panthenyl Ethyl Ether, DMDM Hydantoin, Methylchloroisothiazolinone, Methylisothiazolinone.');

-- 36. Dove Beauty Bar
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000036', 'Dove Cream Beauty Bathing Bar', 'Dove', '8901030712345', 'soap',
 'Sodium Lauroyl Isethionate, Stearic Acid, Sodium Palmitate, Water, Lauric Acid, Sodium Isethionate, Sodium Stearate, Cocamidopropyl Betaine, Sodium Palm Kernelate, Perfume, Glycerin, Sodium Chloride, Zinc Oxide, Tetrasodium EDTA, Tetrasodium Etidronate, Titanium Dioxide.');

-- 37. Lifebuoy Total
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000037', 'Lifebuoy Total 10 Soap Bar', 'Lifebuoy', '8901030612345', 'soap',
 'Sodium Palmate, Sodium Palm Kernelate, Water, Talc, Glycerin, Perfume, Sodium Chloride, Terpineol, Thymol, Silver Oxide, Titanium Dioxide, PEG-45M, Pentasodium Pentetate, Tetrasodium Etidronate, VP/VA Copolymer, Disodium Distyrylbiphenyl Disulfonate, CI 11680, CI 12490.');

-- 38. Dettol Original Soap
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000038', 'Dettol Original Germ Protection Soap', 'Dettol', '8901396324508', 'soap',
 'Sodium Palmate, Sodium Palm Kernelate, Aqua, Talc, Glycerin, Parfum, Chloroxylenol, Sodium Chloride, C12-15 Alkyl Benzoate, Titanium Dioxide, Tetrasodium EDTA, Tetrasodium Etidronate, CI 11680, CI 74260.');

-- 39. Axe Dark Temptation Deodorant
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000039', 'Axe Dark Temptation Body Spray Deodorant', 'Axe', '8901030800123', 'deodorant',
 'Alcohol Denat., Butane, Isobutane, Propane, Parfum, Ethylhexylglycerin, Citral, Citronellol, Coumarin, Limonene, Linalool.');

-- 40. Parachute Coconut Oil
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000040', 'Parachute 100% Pure Coconut Oil', 'Parachute', '8901088000123', 'hair_oil',
 '100% Pure Coconut Oil.');


-- ──────────────────────────────────────────────────────────────
-- 4. CLEANING PRODUCTS (10)
-- ──────────────────────────────────────────────────────────────

-- 41. Dettol Original Liquid
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000041', 'Dettol Antiseptic Disinfectant Liquid', 'Dettol', '8901396350101', 'disinfectant',
 'Chloroxylenol (4.8% w/v), Terpineol, Absolute Alcohol (7.3% v/v), Caramel (INS 150c), Castor Oil Soap, Water Q.S.');

-- 42. Lizol Floral
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000042', 'Lizol Disinfectant Floor Cleaner (Floral)', 'Lizol', '8901396310012', 'floor_cleaner',
 'Benzalkonium Chloride (50%) 0.95% w/w, Lauryl Alcohol Ethoxylate, Sodium Bicarbonate, Fragrance, Carmoisine (CI 14720), Water Q.S.');

-- 43. Harpic Power Plus
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000043', 'Harpic Power Plus Disinfectant Toilet Cleaner', 'Harpic', '8901396300123', 'toilet_cleaner',
 'Hydrochloric Acid (10.5% w/v), Cetyl Trimethyl Ammonium Chloride, Oleyl Amine Ethoxylate, Acid Blue 80 (CI 61585), Fragrance, Water Q.S.');

-- 44. Vim Dishwash Bar
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000044', 'Vim Dishwash Bar', 'Vim', '8901030600123', 'dishwash',
 'Sodium Linear Alkylbenzene Sulfonate, Sodium Carbonate, Sodium Silicate, Dolomite, Lemon Extract, Tartrazine (CI 19140), Water.');

-- 45. Rin Supreme Detergent
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000045', 'Rin Detergent Powder', 'Rin', '8901030500123', 'detergent',
 'Sodium Linear Alkylbenzene Sulfonate, Sodium Carbonate, Sodium Sulfate, Sodium Tripolyphosphate, Optical Brightener, Perfume, CI 42090.');

-- 46. Surf Excel Matic
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000046', 'Surf Excel Matic Front Load Detergent Powder', 'Surf Excel', '8901030400123', 'detergent',
 'Sodium Linear Alkylbenzene Sulfonate, Sodium Carbonate, Sodium Silicate, Sodium Tripolyphosphate, Enzymes (Protease, Amylase), Optical Brightener, Perfume.');

-- 47. Ariel Matic Front Load
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000047', 'Ariel Matic Front Load Washing Powder', 'Ariel', '4902430600123', 'detergent',
 'Anionic Surfactants (Sodium Linear Alkylbenzene Sulfonate), Non-ionic Surfactants, Zeolites, Polycarboxylates, Enzymes, Optical Brighteners, Perfume.');

-- 48. Colin Glass Cleaner
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000048', 'Colin Glass and Surface Cleaner', 'Colin', '8901396340123', 'glass_cleaner',
 'Isopropyl Alcohol, Isopropanolamine, Ethylene Glycol Monobutyl Ether, Fragrance, Brilliant Blue FCF (CI 42090), Water.');

-- 49. Mortein Mosquito Repellent Liquid
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000049', 'Mortein Peaceful Nights Liquid Vaporiser', 'Mortein', '8901396360123', 'insecticide',
 'Transfluthrin (1.6% w/w), Deodorised Kerosene (98.4% w/w).');

-- 50. Good Knight Fast Card
INSERT INTO products (id, name, brand, barcode, category_slug, raw_ingredient_text) VALUES
('d0000000-0000-4000-a000-000000000050', 'Goodknight Fast Card Mosquito Repellent', 'Goodknight', '8901023001234', 'insecticide',
 'TFT (TFT / Transfluthrin 0.7% w/w), Paper Substrate, Fragrance.');


-- ══════════════════════════════════════════════════════════════
-- PRODUCT INGREDIENTS LINKING TABLE
-- Linking products to seeded canonical ingredient IDs
-- ══════════════════════════════════════════════════════════════

-- 1. Maggi 2-Minute Noodles
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000001', 'a0000000-0000-4000-a000-000000000018', 15, 'Flavour enhancer (635) / Hydrolysed groundnut protein'); -- MSG equivalent glutamate

-- 2. Parle-G Biscuits
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000002', 'a0000000-0000-4000-a000-000000000049', 8, 'Dough Conditioner (223)');

-- 3. Britannia Good Day
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000003', 'a0000000-0000-4000-a000-000000000039', 11, 'Nature Identical Flavouring Substances');

-- 4. Lay's Classic Salted
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000004', 'a0000000-0000-4000-a000-000000000020', 4, 'Antioxidant (319)');

-- 5. Kurkure Masala Munch
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000005', 'a0000000-0000-4000-a000-000000000018', 18, 'Flavour enhancers (627, 631)');

-- 7. Bournvita
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000007', 'a0000000-0000-4000-a000-000000000039', 15, 'Flavours (Natural, Nature Identical and Artificial (Vanilla) Flavouring Substances)');

-- 8. Horlicks
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000008', 'a0000000-0000-4000-a000-000000000039', 11, 'Nature Identical Flavouring Substances');

-- 9. Boost
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000009', 'a0000000-0000-4000-a000-000000000039', 12, 'Nature Identical Flavouring Substances');

-- 11. Amul Butter
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000011', 'a0000000-0000-4000-a000-000000000039', 3, 'Permitted Natural Colour (INS 160a(i))');

-- 12. Amul Cheese Slices
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000012', 'a0000000-0000-4000-a000-000000000005', 5, 'Preservative (INS 202)');

-- 13. Kissan Mixed Fruit Jam
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000013', 'a0000000-0000-4000-a000-000000000004', 5, 'Preservative (INS 211)'),
('d0000000-0000-4000-a000-000000000013', 'a0000000-0000-4000-a000-000000000017', 6, 'Synthetic Food Colour (INS 122)'),
('d0000000-0000-4000-a000-000000000013', 'a0000000-0000-4000-a000-000000000012', 7, 'Synthetic Food Colour (INS 102)'),
('d0000000-0000-4000-a000-000000000013', 'a0000000-0000-4000-a000-000000000016', 8, 'Synthetic Food Colour (INS 133)');

-- 15. Knorr Chicken Soup
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000015', 'a0000000-0000-4000-a000-000000000018', 9, 'Flavour Enhancers (INS 627, INS 631)');

-- 16. Sunfeast Dark Fantasy
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000016', 'a0000000-0000-4000-a000-000000000039', 11, 'Flavours');

-- 17. Hide & Seek
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000017', 'a0000000-0000-4000-a000-000000000039', 5, 'Artificial Flavour (Vanilla)');

-- 20. Coca-Cola / Thums Up
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000020', 'a0000000-0000-4000-a000-000000000021', 3, 'Acidity Regulator (338)'),
('d0000000-0000-4000-a000-000000000020', 'a0000000-0000-4000-a000-000000000039', 6, 'Flavours (Natural, Nature-Identical & Artificial (Cola) Flavouring Substances)');

-- 21. Glow & Lovely
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000021', 'a0000000-0000-4000-a000-000000000040', 10, 'Dimethicone'),
('d0000000-0000-4000-a000-000000000021', 'a0000000-0000-4000-a000-000000000036', 11, 'Titanium Dioxide'),
('d0000000-0000-4000-a000-000000000021', 'a0000000-0000-4000-a000-000000000048', 12, 'Phenoxyethanol'),
('d0000000-0000-4000-a000-000000000021', 'a0000000-0000-4000-a000-000000000001', 13, 'Methylparaben'),
('d0000000-0000-4000-a000-000000000021', 'a0000000-0000-4000-a000-000000000002', 14, 'Propylparaben'),
('d0000000-0000-4000-a000-000000000021', 'a0000000-0000-4000-a000-000000000039', 20, 'Parfum');

-- 22. Pond's Bright Beauty
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000022', 'a0000000-0000-4000-a000-000000000036', 6, 'Titanium Dioxide'),
('d0000000-0000-4000-a000-000000000022', 'a0000000-0000-4000-a000-000000000040', 10, 'Dimethicone'),
('d0000000-0000-4000-a000-000000000022', 'a0000000-0000-4000-a000-000000000048', 11, 'Phenoxyethanol'),
('d0000000-0000-4000-a000-000000000022', 'a0000000-0000-4000-a000-000000000039', 12, 'Parfum'),
('d0000000-0000-4000-a000-000000000022', 'a0000000-0000-4000-a000-000000000001', 13, 'Methylparaben'),
('d0000000-0000-4000-a000-000000000022', 'a0000000-0000-4000-a000-000000000002', 14, 'Propylparaben');

-- 23. Nivea Soft
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000023', 'a0000000-0000-4000-a000-000000000024', 3, 'Paraffinum Liquidum'),
('d0000000-0000-4000-a000-000000000023', 'a0000000-0000-4000-a000-000000000040', 16, 'Dimethicone'),
('d0000000-0000-4000-a000-000000000023', 'a0000000-0000-4000-a000-000000000048', 18, 'Phenoxyethanol'),
('d0000000-0000-4000-a000-000000000023', 'a0000000-0000-4000-a000-000000000039', 23, 'Parfum');

-- 24. Himalaya Neem Face Wash
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000024', 'a0000000-0000-4000-a000-000000000046', 4, 'Cocamidopropyl Betaine'),
('d0000000-0000-4000-a000-000000000024', 'a0000000-0000-4000-a000-000000000045', 10, 'Sodium Hydroxide'),
('d0000000-0000-4000-a000-000000000024', 'a0000000-0000-4000-a000-000000000048', 11, 'Phenoxyethanol'),
('d0000000-0000-4000-a000-000000000024', 'a0000000-0000-4000-a000-000000000039', 12, 'Fragrance'),
('d0000000-0000-4000-a000-000000000024', 'a0000000-0000-4000-a000-000000000012', 16, 'CI 19140'),
('d0000000-0000-4000-a000-000000000024', 'a0000000-0000-4000-a000-000000000016', 17, 'CI 42090');

-- 25. Neutrogena Oil-Free Moisturiser
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000025', 'a0000000-0000-4000-a000-000000000040', 6, 'Dimethicone'),
('d0000000-0000-4000-a000-000000000025', 'a0000000-0000-4000-a000-000000000042', 9, 'PEG-100 Stearate'),
('d0000000-0000-4000-a000-000000000025', 'a0000000-0000-4000-a000-000000000001', 13, 'Methylparaben'),
('d0000000-0000-4000-a000-000000000025', 'a0000000-0000-4000-a000-000000000002', 14, 'Propylparaben'),
('d0000000-0000-4000-a000-000000000025', 'a0000000-0000-4000-a000-000000000048', 15, 'Phenoxyethanol');

-- 27. Garnier Bright Complete
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000027', 'a0000000-0000-4000-a000-000000000036', 8, 'Titanium Dioxide'),
('d0000000-0000-4000-a000-000000000027', 'a0000000-0000-4000-a000-000000000045', 9, 'Potassium Hydroxide'),
('d0000000-0000-4000-a000-000000000027', 'a0000000-0000-4000-a000-000000000040', 11, 'Dimethicone'),
('d0000000-0000-4000-a000-000000000027', 'a0000000-0000-4000-a000-000000000048', 13, 'Phenoxyethanol'),
('d0000000-0000-4000-a000-000000000027', 'a0000000-0000-4000-a000-000000000001', 15, 'Methylparaben'),
('d0000000-0000-4000-a000-000000000027', 'a0000000-0000-4000-a000-000000000039', 16, 'Parfum');

-- 28. Olay Natural White
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000028', 'a0000000-0000-4000-a000-000000000040', 6, 'Dimethicone'),
('d0000000-0000-4000-a000-000000000028', 'a0000000-0000-4000-a000-000000000036', 9, 'Titanium Dioxide'),
('d0000000-0000-4000-a000-000000000028', 'a0000000-0000-4000-a000-000000000001', 16, 'Methylparaben'),
('d0000000-0000-4000-a000-000000000028', 'a0000000-0000-4000-a000-000000000002', 17, 'Propylparaben'),
('d0000000-0000-4000-a000-000000000028', 'a0000000-0000-4000-a000-000000000039', 20, 'Fragrance');

-- 29. Clean & Clear Foaming Face Wash
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000029', 'a0000000-0000-4000-a000-000000000041', 2, 'Triethanolamine'),
('d0000000-0000-4000-a000-000000000029', 'a0000000-0000-4000-a000-000000000026', 8, 'Cocamide DEA'),
('d0000000-0000-4000-a000-000000000029', 'a0000000-0000-4000-a000-000000000039', 9, 'Fragrance'),
('d0000000-0000-4000-a000-000000000029', 'a0000000-0000-4000-a000-000000000047', 10, 'Benzophenone-4'),
('d0000000-0000-4000-a000-000000000029', 'a0000000-0000-4000-a000-000000000001', 12, 'Methylparaben'),
('d0000000-0000-4000-a000-000000000029', 'a0000000-0000-4000-a000-000000000002', 13, 'Propylparaben');

-- 30. Lacto Calamine Lotion
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000030', 'a0000000-0000-4000-a000-000000000039', 9, 'Perfume'),
('d0000000-0000-4000-a000-000000000030', 'a0000000-0000-4000-a000-000000000048', 10, 'Phenoxyethanol'),
('d0000000-0000-4000-a000-000000000030', 'a0000000-0000-4000-a000-000000000001', 11, 'Methylparaben'),
('d0000000-0000-4000-a000-000000000030', 'a0000000-0000-4000-a000-000000000002', 12, 'Propylparaben');

-- 31. Colgate Strong Teeth
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000031', 'a0000000-0000-4000-a000-000000000010', 4, 'Sodium Lauryl Sulfate'),
('d0000000-0000-4000-a000-000000000031', 'a0000000-0000-4000-a000-000000000051', 8, 'Sodium Monofluorophosphate'),
('d0000000-0000-4000-a000-000000000031', 'a0000000-0000-4000-a000-000000000043', 12, 'Sodium Saccharin'),
('d0000000-0000-4000-a000-000000000031', 'a0000000-0000-4000-a000-000000000036', 16, 'CI 77891');

-- 32. Pepsodent Germicheck
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000032', 'a0000000-0000-4000-a000-000000000010', 5, 'Sodium Lauryl Sulfate'),
('d0000000-0000-4000-a000-000000000032', 'a0000000-0000-4000-a000-000000000051', 7, 'Sodium Monofluorophosphate'),
('d0000000-0000-4000-a000-000000000032', 'a0000000-0000-4000-a000-000000000025', 10, 'Triclosan'),
('d0000000-0000-4000-a000-000000000032', 'a0000000-0000-4000-a000-000000000043', 11, 'Sodium Saccharin'),
('d0000000-0000-4000-a000-000000000032', 'a0000000-0000-4000-a000-000000000036', 12, 'Cl 77891');

-- 33. Clinic Plus Shampoo
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000033', 'a0000000-0000-4000-a000-000000000011', 2, 'Sodium Laureth Sulfate'),
('d0000000-0000-4000-a000-000000000033', 'a0000000-0000-4000-a000-000000000041', 3, 'TEA-Dodecylbenzenesulfonate'),
('d0000000-0000-4000-a000-000000000033', 'a0000000-0000-4000-a000-000000000046', 4, 'Cocamidopropyl Betaine'),
('d0000000-0000-4000-a000-000000000033', 'a0000000-0000-4000-a000-000000000039', 6, 'Perfume'),
('d0000000-0000-4000-a000-000000000033', 'a0000000-0000-4000-a000-000000000006', 10, 'DMDM Hydantoin'),
('d0000000-0000-4000-a000-000000000033', 'a0000000-0000-4000-a000-000000000045', 13, 'Sodium Hydroxide'),
('d0000000-0000-4000-a000-000000000033', 'a0000000-0000-4000-a000-000000000016', 16, 'CI 42090');

-- 34. Head & Shoulders Anti-Dandruff
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000034', 'a0000000-0000-4000-a000-000000000011', 2, 'Sodium Laureth Sulfate'),
('d0000000-0000-4000-a000-000000000034', 'a0000000-0000-4000-a000-000000000046', 6, 'Cocamidopropyl Betaine'),
('d0000000-0000-4000-a000-000000000034', 'a0000000-0000-4000-a000-000000000039', 9, 'Fragrance'),
('d0000000-0000-4000-a000-000000000034', 'a0000000-0000-4000-a000-000000000040', 11, 'Dimethicone'),
('d0000000-0000-4000-a000-000000000034', 'a0000000-0000-4000-a000-000000000004', 12, 'Sodium Benzoate');

-- 35. Pantene Pro-V
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000035', 'a0000000-0000-4000-a000-000000000011', 2, 'Sodium Laureth Sulfate'),
('d0000000-0000-4000-a000-000000000035', 'a0000000-0000-4000-a000-000000000046', 3, 'Cocamidopropyl Betaine'),
('d0000000-0000-4000-a000-000000000035', 'a0000000-0000-4000-a000-000000000039', 8, 'Fragrance'),
('d0000000-0000-4000-a000-000000000035', 'a0000000-0000-4000-a000-000000000004', 11, 'Sodium Benzoate'),
('d0000000-0000-4000-a000-000000000035', 'a0000000-0000-4000-a000-000000000040', 12, 'Dimethicone'),
('d0000000-0000-4000-a000-000000000035', 'a0000000-0000-4000-a000-000000000006', 15, 'DMDM Hydantoin');

-- 36. Dove Beauty Bar
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000036', 'a0000000-0000-4000-a000-000000000046', 8, 'Cocamidopropyl Betaine'),
('d0000000-0000-4000-a000-000000000036', 'a0000000-0000-4000-a000-000000000039', 10, 'Perfume'),
('d0000000-0000-4000-a000-000000000036', 'a0000000-0000-4000-a000-000000000036', 16, 'Titanium Dioxide');

-- 37. Lifebuoy Total
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000037', 'a0000000-0000-4000-a000-000000000035', 4, 'Talc'),
('d0000000-0000-4000-a000-000000000037', 'a0000000-0000-4000-a000-000000000039', 6, 'Perfume'),
('d0000000-0000-4000-a000-000000000037', 'a0000000-0000-4000-a000-000000000036', 11, 'Titanium Dioxide'),
('d0000000-0000-4000-a000-000000000037', 'a0000000-0000-4000-a000-000000000042', 12, 'PEG-45M');

-- 38. Dettol Original Soap
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000038', 'a0000000-0000-4000-a000-000000000035', 4, 'Talc'),
('d0000000-0000-4000-a000-000000000038', 'a0000000-0000-4000-a000-000000000039', 6, 'Parfum'),
('d0000000-0000-4000-a000-000000000038', 'a0000000-0000-4000-a000-000000000031', 7, 'Chloroxylenol'),
('d0000000-0000-4000-a000-000000000038', 'a0000000-0000-4000-a000-000000000036', 10, 'Titanium Dioxide');

-- 39. Axe Dark Temptation Deodorant
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000039', 'a0000000-0000-4000-a000-000000000039', 5, 'Parfum');

-- 41. Dettol Antiseptic Liquid
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000041', 'a0000000-0000-4000-a000-000000000031', 1, 'Chloroxylenol'),
('d0000000-0000-4000-a000-000000000041', 'a0000000-0000-4000-a000-000000000029', 3, 'Absolute Alcohol');

-- 42. Lizol Floral
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000042', 'a0000000-0000-4000-a000-000000000039', 4, 'Fragrance'),
('d0000000-0000-4000-a000-000000000042', 'a0000000-0000-4000-a000-000000000017', 5, 'Carmoisine (CI 14720)');

-- 43. Harpic Power Plus
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000043', 'a0000000-0000-4000-a000-000000000039', 5, 'Fragrance');

-- 44. Vim Dishwash Bar
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000044', 'a0000000-0000-4000-a000-000000000034', 1, 'Sodium Linear Alkylbenzene Sulfonate'),
('d0000000-0000-4000-a000-000000000044', 'a0000000-0000-4000-a000-000000000012', 6, 'Tartrazine (CI 19140)');

-- 45. Rin Supreme Detergent
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000045', 'a0000000-0000-4000-a000-000000000034', 1, 'Sodium Linear Alkylbenzene Sulfonate'),
('d0000000-0000-4000-a000-000000000045', 'a0000000-0000-4000-a000-000000000032', 4, 'Sodium Tripolyphosphate'),
('d0000000-0000-4000-a000-000000000045', 'a0000000-0000-4000-a000-000000000039', 6, 'Perfume'),
('d0000000-0000-4000-a000-000000000045', 'a0000000-0000-4000-a000-000000000016', 7, 'CI 42090');

-- 46. Surf Excel Matic
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000046', 'a0000000-0000-4000-a000-000000000034', 1, 'Sodium Linear Alkylbenzene Sulfonate'),
('d0000000-0000-4000-a000-000000000046', 'a0000000-0000-4000-a000-000000000032', 4, 'Sodium Tripolyphosphate'),
('d0000000-0000-4000-a000-000000000046', 'a0000000-0000-4000-a000-000000000039', 7, 'Perfume');

-- 47. Ariel Matic
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000047', 'a0000000-0000-4000-a000-000000000034', 1, 'Anionic Surfactants (Sodium Linear Alkylbenzene Sulfonate)'),
('d0000000-0000-4000-a000-000000000047', 'a0000000-0000-4000-a000-000000000039', 7, 'Perfume');

-- 48. Colin Glass Cleaner
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000048', 'a0000000-0000-4000-a000-000000000029', 1, 'Isopropyl Alcohol'),
('d0000000-0000-4000-a000-000000000048', 'a0000000-0000-4000-a000-000000000039', 4, 'Fragrance'),
('d0000000-0000-4000-a000-000000000048', 'a0000000-0000-4000-a000-000000000016', 5, 'Brilliant Blue FCF (CI 42090)');

-- 50. Goodknight Fast Card
INSERT INTO product_ingredients (product_id, ingredient_id, position, raw_name_on_label) VALUES
('d0000000-0000-4000-a000-000000000050', 'a0000000-0000-4000-a000-000000000039', 3, 'Fragrance');

COMMIT;

-- ============================================================
-- STEP 4 COMPLETE: 50 Products Seeded
-- ============================================================

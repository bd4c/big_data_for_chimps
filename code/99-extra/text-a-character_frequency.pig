
-- bat_seasons = LOAD '/tmp/wds2' AS (name_first:chararray);
-- 
-- name_first_chars = FOREACH (GROUP bat_seasons BY name_first) {
--   ltr_cts = CountVals(STRSPLITBAG(group, '(?!^)'));
--   GENERATE group AS name_first, FLATTEN(ltr_cts) AS (char,ct), COUNT_STAR(bat_seasons) AS wd_usages;
-- };
-- 
-- -- nf_chars_stats = FOREACH (GROUP name_first_chars ALL) GENERATE COUNT_STAR(name_first_chars) AS n_terms;
-- 
-- name_first_chars = FOREACH name_first_chars GENERATE
--   char, ct AS term_ct, ct*ct AS term_ctsq, ct*wd_usages AS usage_ct;
-- 
-- ltr_usages = FOREACH (GROUP name_first_chars BY char) {
--   term_ct_mean  = AVG(name_first_chars.term_ct);
--   term_ct_stdev = SQRT(VAR(name_first_chars.term_ct));
--   
--   tot_term_ct   = SUM(name_first_chars.term_ct);
-- 
--   tc_popstdv    = SQRT( (5.0/4.0) * VAR(name_first_chars.term_ct) );
-- 
--   term_range    = COUNT_STAR(name_first_chars);
-- 
--   vv = VAR(name_first_chars.term_ct);
--   v1 = (term_range/4.0) * vv;
--   v2 = (5.0/4.0       ) * vv;
--   v3 = (SUM(name_first_chars.term_ctsq) - (1.0*tot_term_ct*tot_term_ct)/term_range)/(term_range-1.0);
--   v4 = (SUM(name_first_chars.term_ctsq) - (1.0*tot_term_ct*tot_term_ct)/5.0)/4.0;
-- 
--   GENERATE
--     group AS char,
-- 
--     5 AS nn,
--     term_range   AS term_range,
--     tot_term_ct  AS term_ct,
--     'av',
--     term_ct_mean*term_range / 5.0,
--     tot_term_ct / 5.0,
--     term_ct_mean  AS term_ct_mean,
-- 
--     'popsdv',
--     tc_popstdv,
--     tc_popstdv*tc_popstdv,
-- 
--     'v',
--     vv,
--     v1,
--     v2,
--     v3,
--     v4
-- 
--     -- SUM(name_first_chars.usage_ct) AS usage_ct,
--     -- term_ct_stdev AS term_ct_stdev,
--     -- 1.0*tc_popstdv / term_ct_mean AS var_coeff,
--     -- (tc_popstdv    / (1.0 * term_ct_mean * SQRT(5-1))) AS disp1,
--     -- (term_ct_stdev / (1.0 * term_ct_mean * SQRT(SUM(name_first_chars.term_ct)-1))) AS disp
--     ;
-- };
-- ltr_usages = ORDER ltr_usages BY term_ct ASC;
-- 
-- 
-- -- http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.74.9789&rep=rep1&type=pdf
-- -- http://www.linguistics.ucsb.edu/faculty/stgries/research/2008_STG_Dispersion_IJCL.pdf
-- 
-- -- bamnibeupk
-- -- basasbewqn
-- -- bcagabesta
-- -- baghabeaat
-- -- bahaabeaxa
-- 
-- -- bacdefghij
-- -- abcdeaghij
-- -- abcdeaghia
-- -- abadeaghia
-- -- abadeagaai
-- 
-- 
-- DESCRIBE ltr_usages;
-- STORE_TABLE(ltr_usages, 'ltr_usages');  
-- 
-- -- char_cts = FOREACH (GROUP name_first_chars BY char) {
-- --   GENERATE group AS char, COUNT_STAR(name_first_chars.char);
-- -- };
-- 
-- 
-- -- name_first_chars = FOREACH bat_seasons GENERATE
-- --   FLATTEN(STRSPLITBAG(name_first, '(?!^)')) AS char;
-- -- 
-- -- char_cts = FOREACH (GROUP name_first_chars BY char) {
-- --   GENERATE group AS char, COUNT_STAR(name_first_chars.char);
-- -- };
--     
-- -- DUMP char_cts;  
--   
--   -- char_cts  = FOREACH so_chars GENERATE CONCAT($0.token, ':', (chararray)count);
--   --   BagToString(char_cts, '|')
--   -- so_chars   = ORDER chars BY count DESC;
--   -- so_chars   = LIMIT so_chars 5;
-- 
--   -- all_chars  = FOREACH dist GENERATE  -- Coalesce(name_first,'')
--   -- chars      = CountVals(BagConcat(all_chars));
-- 
-- 
-- -- header_num_summ = numeric_summary_header();
-- -- STORE_TABLE(header_num_summ, 'header_num_summ');
-- -- 
-- -- header_str_summ = strings_summary_header();
-- -- STORE_TABLE(header_str_summ, 'header_str_summ');
-- -- 
-- -- STORE_TABLE(H_summary_base, 'H_summary_base');
-- -- STORE_TABLE(H_summary, 'H_summary');
-- -- STORE_TABLE(name_first_summary, 'name_first_summary');

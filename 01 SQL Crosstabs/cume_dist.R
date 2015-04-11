#Retuns the National Cumulative Distribution of average covered charges for records with the drg_definition of "885 - PSYCHOSES"
cume_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT STATE, SUM_COVERAGE, cume_dist()
OVER (ORDER BY SUM_COVERAGE) as Cume_Dist
FROM (SELECT provider_state as STATE, sum(average_covered_charges) as SUM_COVERAGE
FROM hospital
WHERE drg_definition = \'885 - PSYCHOSES\'
GROUP BY provider_state)
ORDER BY cume_dist desc
"')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_jac5699', PASS='orcl_jac5699', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); kable(head(cume_df))

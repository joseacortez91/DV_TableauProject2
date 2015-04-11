#Return Crosstab of Highest number of discharges and its associated DRG_Definition per city. 

rank_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT * FROM (SELECT drg_definition, provider_city, total_discharges, rank() 
OVER (PARTITION BY provider_city order by total_discharges desc) as DISCHARGE_RANK
FROM hospital) 
WHERE DISCHARGE_RANK = 1
ORDER BY 3 desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_jac5699', PASS='orcl_jac5699', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); kable(head(rank_df))

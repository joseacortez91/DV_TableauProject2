#Returns the lowest average total payments for "Chest Pain" hospital visits in the central Texas area, and ranks them by affordability. 

rank_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT provider_name, provider_city, average_total_payments, rank()
OVER (PARTITION BY drg_definition, provider_state ORDER BY average_total_payments) as AFFORDABILITY_RANK
FROM hospital
WHERE drg_definition = \'313 - CHEST PAIN\'
AND provider_state = \'TX\'
AND provider_city IN (\'AUSTIN\', \'DALLAS\', \'SAN ANTONIO\', \'ROUND ROCK\', \'KILEEN\', \'FORT HOOD\',\'COLLEGE STATION\',\'WACO\')"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_jac5699', PASS='orcl_jac5699', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); kable(head(rank_df))

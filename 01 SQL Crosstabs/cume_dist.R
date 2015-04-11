#Retuns Average Cost Information for central Texas, with cumulative distribution partitioned by city. These results are for records with drg_definition of '885 - PSYCHOSES'

cume_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT provider_name, provider_city, average_total_payments, cume_dist()
OVER (PARTITION BY drg_definition, provider_state, provider_city ORDER BY average_total_payments) as cume_dist
FROM hospital
WHERE drg_definition = \'885 - PSYCHOSES\'
AND provider_state = \'TX\'
AND provider_city IN (\'AUSTIN\', \'DALLAS\', \'SAN ANTONIO\', \'ROUND ROCK\', \'KILEEN\', \'FORT HOOD\',\'COLLEGE STATION\',\'WACO\')
"')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_jac5699', PASS='orcl_jac5699', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); kable(head(cume_df))
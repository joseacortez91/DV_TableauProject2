# Returns the average total hospital costs across Texas for different cities with a last column representing the maximum average total cost for each city. For this dataframe we only consider the following case: DRG_DEFINITION = 069 - TRANSIENT ISCHEMIA

nth_df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT drg_definition, provider_state, provider_city, average_total_payments, nth_value(average_total_payments, 1)
OVER (PARTITION BY drg_definition, provider_state, provider_city ORDER BY average_total_payments desc) as max_average_total_payments
FROM hospital
WHERE drg_definition = \'069 - TRANSIENT ISCHEMIA\' AND provider_state = \'TX\'
"')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_jac5699', PASS='orcl_jac5699', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); kable(head(nth_df));

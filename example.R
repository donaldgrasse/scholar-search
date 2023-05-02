url_list = paste0("https://scholar.google.com/scholar?start=", seq(0, 100, 10), "&q=geographic+regression+discontinuity&hl=en&as_sdt=0,5")

data_list <- list()

for(i in 1:length(url_list)){ 
  
  data_list[[i]] <- make_gscholar_df(url_list[i])
  
  
}
num <- c(seq(1, length(url_list),1 ))
result <- dplyr::bind_rows(data_list[num], .id = 'id')

result

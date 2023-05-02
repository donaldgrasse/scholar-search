make_gscholar_df = function(url_name){
  
  packs = c('rvest', 'dplyr', 'qdapRegex')
  lapply(packs, require, character.only = T)
  
  url_name = url_name
  wp = xml2::read_html(url_name)
  
  titles = rvest::html_text(rvest::html_nodes(wp, '.gs_rt'))
  authors_years = rvest::html_text(rvest::html_nodes(wp, '.gs_a'))
  authors = gsub('^(.*?)\\W+-\\W+.*', '\\1', authors_years, perl = TRUE)
  years = gsub('^.*(\\d{4}).*', '\\1', authors_years, perl = TRUE)
  journal = rm_between(authors_years, '-', ',', extract=TRUE)
  
  
  df <- data.frame(titles = titles, authors = authors, years = years,
                   journal = as.character(journal),
                   stringsAsFactors = FALSE)
  
  return(df)
  
}

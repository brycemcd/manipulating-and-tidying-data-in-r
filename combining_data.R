# Combining Data Sets
# What makes a dataset tidy? The unit of analysis!

# dplyr::bind_rows() and dplyr::bind_cols()
# Set operations: dplyr::union(), dplyr::intersect(), dplyr::setdiff()
# SQL like functions: dplyr::left_join(), dplyr::right_join(), dplyr::inner_join(),
# dplyr::full_join(), dplyr::anti_join() <-- like a left join, but with NOT on the right side

delays <- flights %>%
  filter(!is.na(arr_delay)) %>%
  group_by(carrier) %>%
  summarize(avg_delay = mean(arr_delay))
delays

dplyr::inner_join(delays, airlines, by='carrier') %>%
  arrange(avg_delay)

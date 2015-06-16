# Tidying end of section work
# tb2 was set in manipulation

head(population)
head(tb2)

# reshape population into tidy data
pop2 <- population %>%
  gather("year", "population", -country, convert=TRUE)

tb2_with_pop <- inner_join(tb2, pop2, by = c('country', 'year'))

tb3 <- tb2_with_pop %>%
  mutate(rate = cases / population * 10000)
  select(country, year, rate)


# tidying

# Requirements for "tidy" data:
# 1) each variable is saved in its own column
# 2) each observation is saved in its own row
# 3) each type of observation is stored in a single table

# tb2 was created in manipulation
library('tidyr')
cases %>%
  gather("year", "n", 2:4, convert=TRUE)

# Quiz
head(tb)
tb %>%
  gather('age', 'cases', 4:6) %>%
  arrange(country, year, sex, age)

# spread()
pollution %>%
  spread(size, amount)

# quiz
pollution2 <- pollution %>%
  spread(size, amount)
pollution2

pollution2 %>%
  gather('size', 'amount', large:small) %>%
  arrange(desc(city), size)

# unite & separate()

storms2 <- storms %>%
  separate(date, c('year', 'month', 'day'), sep='-', convert = TRUE)

storms2 %>%
  unite("date", year, month, day, sep="/")
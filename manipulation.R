# data manipulation
library('dplyr')
library('nycflights13')
# useful: http://www.rstudio.com/resources/cheatsheets/

str(flights)
# select!
select(flights, ends_with('time'))
select(flights, contains("_"))

# quiz
select(flights, contains("dep_"))
select(flights, ends_with("_time"))
select(flights, dep_time:arr_delay)

# pipes!
# Ctrl + Shift + m is shortcut for %>%
flights  %>% select(contains("dep_"))

# filtering
library('EDAWR')
# filter using logical expression
storms %>% filter(wind >= 50)

# Produces an AND query
storms %>% filter(wind >= 50 &
                  storm %in% c("Alberto", "Arlene"))

storms %>% filter(wind >= 50 |
                  storm %in% c("Alberto", "Arlene"))

# quiz
flights %>%
  filter(!is.na(arr_delay))

flights %>%
  filter(!is.na(arr_delay)) %>%
  select(carrier, arr_delay)

# deriving variables

storms %>%
  mutate(ratio = pressure / wind,
         invert = ratio^-1, # we can use a var we just defined!
         highwind = wind > 50)

# all mutate functions are shown @ 2:18 in the Filter Observations video
# VERY similar to window functions in Postgres

# quiz
flights %>%
  mutate(speed = (distance / air_time) * 60) %>%
  select(carrier, arr_delay, speed)

# summarise
pollution %>%
  summarize(median = median(amount),
            variance = var(amount),
            n = n())

# quiz
flights %>%
  filter(!is.na(air_time) & !is.na(distance)) %>%
  summarize(n = n(),
            n_carriers = n_distinct(carrier),
            total_time = sum(air_time),
            total_dist = sum(distance))

# Group By
pollution %>%
  group_by(city) %>%
  summarize(avg = mean(amount),
            median = median(amount))

# quiz
delays <- flights %>%
            filter(!is.na(arr_delay)) %>%
            group_by(carrier) %>%
            summarize(avg_delay = mean(arr_delay))
delays

# more grouping
# quiz

flights %>%
  group_by(origin, dest) %>%
  summarize(cnt = n())

# arrange
# VERY similar to SQL's ORDER BY

storms %>% arrange(-wind)

delays %>%
  arrange(-avg_delay)

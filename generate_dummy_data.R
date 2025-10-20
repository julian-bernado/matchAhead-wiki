library("readr")
library("dplyr")

generate_multilevel_data <- function(num_schools, school_mean_size, mean_prog) {
  school_ids <- paste0("school", 1:num_schools)
  school_sizes <- floor(rnorm(num_schools, mean = school_mean_size, sd = school_mean_size/5))
  df <- tibble(
    schoolid_nces_enroll = c(),
    glmath_pred = c()
  )
  for (i in 1:num_schools) {
    new_rows <- tibble(
      schoolid_nces_enroll = rep(school_ids[i], length.out = school_sizes[i]),
      glmath_pred = rnorm(school_sizes[i], mean = mean_prog, sd = mean_prog / 5)
    )
    df <- bind_rows(df, new_rows)
  }
  df
}


N <- 3
Ns <- 20
mu_y <- 90

df <- generate_multilevel_data(N, Ns, mu_y)
write_csv(df, "push/data/dummy.csv")
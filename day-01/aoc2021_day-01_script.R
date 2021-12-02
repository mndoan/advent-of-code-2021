# advent-of-code-2021
# Day 1: Sonar Sweep

# Import puzzle input file ----
puzzle_inputfile <- file("day-01/input.txt", open = "r")
puzzle_input <- scan(puzzle_inputfile)
close(puzzle_inputfile)

# Part one ----
# First attempt to determine the number of times a depth measurement increases
# from previous measurement. This can also print out a table showing the
# measurements and changes between measurements.
elevation_change <- c()
increased_count <- 0
for (n in 1:length(puzzle_input)) {
  current_measurement <- puzzle_input[n]
  prev_measurement <- puzzle_input[n - 1]
  if (n - 1 == 0) {
    elevation_change <- c(elevation_change, "N/A - no previous measurement")
  } else if (n > 1 & n <= length(puzzle_input)) {
    measurement_diff <- current_measurement - prev_measurement
    if (measurement_diff > 0) {
      elevation_change <- c(elevation_change, "Increased")
      increased_count <- increased_count + 1
    } else if (measurement_diff < 0) {
      elevation_change <- c(elevation_change, "Decreased")
    } else {
      elevation_change <- c(elevation_change, "Unchanged")
    }
  }
}
puzzle_output <- data.frame(puzzle_input, elevation_change)
View(puzzle_output)
print(increased_count)  # Output: 1548

# If only interested in the number of times the measurement increases.
# This code calculates the difference between two consecutive measurements, then
# sums the number of occurrences where the difference is a positive value.
sum(diff(puzzle_input) > 0) # Output: 1548

# Part 2 ----
x <- puzzle_input |>
  embed(3) |> # creates an n x 3 matrix with lags (three-measurement windows)
  rowSums() |>  # sums values of each three-measurement windows
  diff()  # differences between two consecutive three-measurement windows
sum(x > 0)  # Output: 1589

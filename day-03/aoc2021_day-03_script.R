# advent-of-code-2021
# Day 03: Binary Diagnostic

# Part One ----
bits_input <- read.table("input.txt", colClasses = "character")
bits <- data.frame(do.call("rbind", strsplit(bits_input$V1,
                                             split = "",
                                             fixed = TRUE))) |>
  lapply(as.numeric)

gamma <- c()
epsilon <- c()
for (i in 1:length(bits)) {
  if (sum(bits[[i]]) / length(bits[[i]]) > 0.5) {
    gamma <- c(gamma, 1)
    epsilon <- c(epsilon, 0)
  } else {
    gamma <- c(gamma, 0)
    epsilon <- c(epsilon, 1)
  }
}

gamma_int <- strtoi(paste(gamma, collapse = ""), 2)
epsilon_int <- strtoi(paste(epsilon, collapse = ""), 2)

gamma_int * epsilon_int  # Output: 3242606

# Part Two ----
bits <- data.frame(do.call("cbind", bits))
O2_bits <- bits
CO2_bits <- bits

for (i in 1:length(O2_bits)) {
  if (nrow(O2_bits) == 1) {
    break
  } else {
    if (sum(O2_bits[i]) / nrow(O2_bits[i]) >= 0.5) {
      O2_bits <- O2_bits[which(O2_bits[i] == 1), ]
    } else {
      O2_bits <- O2_bits[which(O2_bits[i] == 0), ]
    }
  }
}

for (i in 1:length(CO2_bits)) {
  if (nrow(CO2_bits) == 1) {
    break
  } else {
    if (sum(CO2_bits[i]) / nrow(CO2_bits[i]) >= 0.5) {
      CO2_bits <- CO2_bits[which(CO2_bits[i] == 0), ]
    } else {
      CO2_bits <- CO2_bits[which(CO2_bits[i] == 1), ]
    }
  }
}

O2_int <- strtoi(paste(O2_bits, collapse = ""), 2)
CO2_int <- strtoi(paste(CO2_bits, collapse = ""), 2)

O2_int * CO2_int # Life support rating: 4856080

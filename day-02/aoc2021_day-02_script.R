# advent-of-code-2021
# Day 2: Dive!

puzzle_input <- read.table("input.txt", header = FALSE)

# Part one ----
horizontal <- 0
depth <- 0

for (n in 1:length(puzzle_input$V1)) {
  if (puzzle_input$V1[n] == "forward") {
    horizontal <- horizontal + puzzle_input$V2[n]
  } else if (puzzle_input$V1[n] == "down") {
    depth <- depth + puzzle_input$V2[n]
  } else if (puzzle_input$V1[n] == "up") {
    depth <- depth - puzzle_input$V2[n]
  }
}
cat(horizontal * depth) # Output: 1427868

# Part two ----
horizontal <- 0
depth <- 0
aim <- 0

for (n in 1:length(puzzle_input$V1)) {
  if (puzzle_input$V1[n] == "forward") {
    horizontal <- horizontal + puzzle_input$V2[n]
    depth <- depth + (aim * puzzle_input$V2[n])
  } else if (puzzle_input$V1[n] == "down") {
    aim <- aim + puzzle_input$V2[n]
  } else if (puzzle_input$V1[n] == "up") {
    aim <- aim - puzzle_input$V2[n]
  }
}
cat(horizontal * depth) # Output: 1568138742

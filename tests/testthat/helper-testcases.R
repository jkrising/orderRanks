counter <- function()
{
  l <- 1:5
  right <- l + 2.9
  data.frame(left = l, right = right)
}

empty <- function()
{
  left <- 0:9 / 10
  right <- left + 1
  data.frame(left = left, right = right)
}

improper <- function()
{
  data.frame(left = c(0, 1, 2.1, 3.2), right = c(4.5, 2, 3.1, 4.2))
}

integers <- function()
{
  data.frame(left = c(0, 0, 1, 2), right = c(1, 2, 2, 3))
}

linear <- function()
{
  left <- 1:5
  right <- left + 0.9
  data.frame(left = left, right = right)
}

simple <- function()
{
  left <- 0:2 * 0.5 + 1
  right <- left + 0.75
  data.frame(left = left, right = right)
}

weak1 <- function()
{
  left <- c(1, 2, 5)
  right <- c(4, 3, 6)
  data.frame(left = left, right = right)
}

weak2 <- function()
{
  left <- sort(c(1:3, 1:3 + 0.1))
  right <- left + 0.7
  data.frame(left = left, right = right)
}

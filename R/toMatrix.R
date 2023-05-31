toMatrix <- function(M, n, strict, binary)
{
  M <- matrix(M, nrow = n, ncol = n)
  if (!strict)
  {
    M <- M | (rep(TRUE, n) |> diag())
  }
  if (binary)
  {
    M <- 1 * M
  }
  M
}

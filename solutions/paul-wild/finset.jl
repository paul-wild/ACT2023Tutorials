struct FinSet
  n::Int
end

struct FinFunction
  dom::FinSet
  codom::FinSet
  values::Vector{Int}
end

A, B = FinSet(4), FinSet(5)
f = FinFunction(A, B, [1,3,2,5])

function product(A, B)
  C = FinSet(A.n * B.n)
  [C,
  FinFunction(C, A, repeat(1:A.n, B.n)),
  FinFunction(C, B, reduce(vcat,repeat([i], B.n) for i in 1:A.n))]
end

println(product(A, B))
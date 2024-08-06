# PrimeSieve.jl

A simple prime sieve written in Julia.

```jldoctest
julia> primesieve(7)
(4, [2, 3, 5, 7])

julia> primesieve(30)
(10, [2, 3, 5, 7, 11, 13, 17, 19, 23, 29])

julia> @time n, v = primesieve(typemax(Int32));
  9.227227 seconds (10 allocations: 486.249 MiB, 0.96% gc time)

julia> n
105097565
```

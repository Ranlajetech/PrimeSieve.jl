# PrimeSieve.jl

A simple prime sieve written in Julia.

```jldoctest
julia> @time n, v = primesieve(typemax(Int32));
  9.227227 seconds (10 allocations: 486.249 MiB, 0.96% gc time)

julia> n
105097565
```

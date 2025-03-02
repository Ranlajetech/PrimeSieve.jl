module PrimeSieve

"""
    primesieve(x::T) => Tuple{T, Vector{T}}

Return a tuple contains the quantity of prime numbers less or equal than x
and an Vector of these prime numbers.

# Examples
```jldoctest
julia> primesieve(7)
(4, [2, 3, 5, 7])

julia> primesieve(30)
(10, [2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
```
"""
function primesieve(x::T)::Tuple{T, Vector{T}} where T<:Integer
    x < 2 && return (T(0), T[])
    x < 3 && return (T(1), T[2])
    x < 5 && return (T(2), T[2, 3])
    # wrapping around may happen
    tmp_div, tmp_rem = divrem(x, 6)
    lenA = tmp_div + (tmp_rem == 5) # div(x + 1, 6)
    lenB = tmp_div - (tmp_rem == 0) # div(x - 1, 6)
    A = trues(lenA) # A: 6n - 1
    B = trues(lenB) # B: 6n + 1
    for k::T in 1:div(floor(T, sqrt(x)) + 1, 6)
        if A[k]
            AA = (6k)k : (6k-1) : lenA
            AB = (6k-2)k : (6k-1) : lenB
            A[AA] .= false
            B[AB] .= false
        end
        if B[k]
            BA = ((6k+6)k+1) : (6k+1) : lenA
            BB = (6k+2)k : (6k+1) : lenB
            A[BA] .= false
            B[BB] .= false
        end
    end
    lentotal::T = sum(A) + sum(B) + 2
    primes::Vector{T} = zeros(T, lentotal)
    primes[1:2] = [2, 3]
    num::T = 2
    for k::T in 1:lenB
        if A[k]
            num += 1
            primes[num] = 6k-1
        end
        if B[k]
            num += 1
            primes[num] = 6k+1
        end
    end
    if lenA > lenB
        if A[lenA]
            num += 1
            primes[num] = 6lenA-1
        end
    end
    return (lentotal, primes)
end

end

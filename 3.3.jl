function eratosphenes_sieve(n::Integer)
    prime_indexes = ones(Bool, n)
    prime_indexes[begin] = false
    i = 2
    prime_indexes[i^2:i:n] .= false
    i = 3
    while i <= n 
        prime_indexes[i^2:2i:n] .= false
        i += 1
        while i <= n && prime_indexes[i] == false
            i += 1
        end
    end
    return findall(prime_indexes)
end


function degree(n, p)
    k = 0
    n, r = divrem(n, p)
    while n > 0 && r == 0
        k += 1
        n, r = divrem(n, p)
    end
    return k
end
  

function factorize(n::IntType) where IntType <: Integer
    list = NamedTuple{(:div, :deg), Tuple{IntType, IntType}}[]
    for p in eratosphenes_sieve(Int(ceil(n/2)))
        k = degree(n, p)
        if k > 0
            push!(list, (div=p, deg=k))
        end
    end
    return list
end
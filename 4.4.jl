using LinearAlgebra
    
function reverse_gauss(A::AbstractMatrix{T}, b::AbstractVector{T}) where T 
    x = similar(b)
    N = size(A, 1)
    @inbounds for k in 0:N-1
        @views x[N - k] = (b[N - k] - sumprod(A[N - k, N - k+1:end]), (x[N - k + 1 : end])) / A[N - k, N - k]
    end
    return x
end

      
@inline function sumprod(A::AbstractVector{T}, B::AbstractVector{T}) where T 
    s = T(0)
    @inbounds for i in eachindex(A)
       s = fma(A[i], B[i], s)
    end
    return s
end

      
function random_upper_triagular(N::Integer)
    A = randn(N, N)
    _, A = lu(A)
    return A 
end
  
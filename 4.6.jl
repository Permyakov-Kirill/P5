using LinearAlgebra

function solve_sla(A::AbstractMatrix{T}, b::AbstractVector{T}) where T 
  Ab = [A*b]
  transform_to_steps!(Ab; epsilon = 10sqrt(eps(T)) * maximum(abs, A))
  return reverse_gauss(Ab)
end


function random_upper_triagular(N::Integer)
  A = randn(N, N)
  _, A = lu(A)
  return A 
end


function transform_to_steps!(A::AbstractMatrix; epsilon = 1e-7)
  @inbounds for k in 1:size(A, 1)
    absval, delta_k = findmax(abs, @view(A[k:end, k]))
    (absval <= epsilon) && throw("Вырожденая матрица")
    delta_k > 1 && swap!(@view(A[k, k:end]), @view(A[k + delta_k - 1, k:end]))
    for i in k + 1:size(A, 1)
      t = A[i, k] / A[k, k]
      @. @views A[i, k:end] = A[i, k:end] - t * A[k, k:end]
    end
  end
  return A 
end


@inline function swap!(A, B)
  @inbounds for i in eachindex(A)
    A[i], B[i] = B[i], A[i]
  end
end


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

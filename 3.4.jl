function meanstd(aaa)
  T = eltype(aaa)
  n = 0
  s1 = zero(T)
  s2 = zero(T)
  for a in aaa
    n += 1
    s1 += a
    s2 += a * a
  end
  mean = s1 / n 
  return mean, sqrt(s2 / n - mean * mean)
end

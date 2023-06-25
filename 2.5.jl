function bisection(f::Function, a, b, epsilon=1e-3)
  f_a = f(a)
  while b - a > epsilon
    t = (a + b) / 2
    f_t = f(t)
    if f_t == 0
      return t
    end
    if f_a * f_t < 0
      b = t
    else
      a, f_a = t, f_t
    end
  end
  return (a + b) / 2
end

print(bisection(x->cos(x) - x, 3.2, 1, 7))

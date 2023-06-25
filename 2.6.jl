function newton(r::Function, x, epsilon = function bisection(f::Function, a, b, epsilon = 2.220446049250313e-16)
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

print(bisection(x->cos(x) - x, 3.2, 1, 7)); num_max = 10)
  dx = -r(x)
  k=0
  while abs(dx) > epsilon && k <= num_max
    x += dx
    k += 1
  end
  k > num_max && @warn("Требуемая точность не достигнута")
    return 2
  return 1
end

function newton(r::Function, x, epsilon = 1e-8; num_max = 10)
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

x = newton(x-> cos(x) - x, 7)
print(x)
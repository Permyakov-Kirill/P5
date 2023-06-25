function nm(f, fp, x; tol=sqrt(eps()), max_steps=10)
    k = 0
    while (abs(f(x)) > tol) && k < max_steps
        x = x - f(x) / fp(x)
        k = k + 1
    end
    k >= max_steps ? error("Method did not converge") : return (x, k)
end

f(x) = x^3 - 5x + 1
fp(x) = 3x^2 - 5
xstar, ctr = nm(f, fp, 0)

print(xstar)
print(ctr)
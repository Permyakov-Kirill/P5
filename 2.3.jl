function log(x, a, eps)
  y = 0
  z = x
  t = 1

  while abs(t) >= eps || z <= 1 / a || z >= a
    if z >= a
      z = z / a
      y = y + t
    elseif z <= 1 / a
      z = z * a
      y = y - t
    else
      z = z * z
      t = t / 2
    end
  end
  return y
end

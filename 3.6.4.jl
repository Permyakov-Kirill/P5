function maxvalence(tree::Tree)
  p = length(tree.sub)
  for i in tree.sub
    p = max(p, maxvalence(sub))
  end
  return p
end

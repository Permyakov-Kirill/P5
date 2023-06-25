function vernumber(tree::Tree)
  n = 0
  for sub in tree.sub
    n += vernumber(sub)
  end
  return n + 1
end

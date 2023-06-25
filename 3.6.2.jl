function leavesnumbers(tree::Tree)
  if isempty(tree.sum)
    return 1
  end
  n = 0
  for sub in tree.sub
    n += leavesnumber(sub)
  end
  return n 
end

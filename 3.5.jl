ConnectList{T} = Vector{Vector{T}}
NestedVectors = Vector


function convert_to_nested(tree::ConnectList{T}, root::T) where T 
  nested_tree = []
  for subroot in tree[root]
    push!(nested_tree, convert(tree, subroot))
  end
  push!(nested_tree, root)
  return nested_tree
end


tree = [ [2, 3], [], [4, 5], [], [] ]
nested_tree = convert_to_nested(tree, 1)


function convert_to_dict(tree::NestedVectors)
  T = typeof(tree[end])
  connect_tree = Dict{T, Vector{T}}()

  function recurs_trace(tree)
    connect_tree[tree[end]] = []
    for subtree in tree[1:end-1]
      push!(connect_tree[tree[end]], recurs_trace(subtree))
    end
    return tree[end]
  end

  recurs_trace(tree)
  return connect_tree
end


nested_tree = Any[Any[2], Any[Any[4], Any[5], 3], 1]
dict_tree = convert_to_dict(nested_tree)

Dict(
  5=>[],
  4=>[],
  2=>[],
  3=>[4, 5],
  1=>[2, 3]
)

tree = [ [2, 3], [], [4, 5], [], [] ]


function convert_to_list(tree::Dict{T, Vector{T}}) where T 
  list_tree = Vector{Vector{T}}(undef, length(tree))
  for subroot in eachindex(list_tree)
    list_tree[subroot] = tree[subroot]
  end
  return list_tree
end

list_tree = convert_to_list(dict_tree)

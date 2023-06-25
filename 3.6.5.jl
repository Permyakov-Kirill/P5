function meanpath(tree:Tree)
  
    function sumpath_numver(tree::Tree)
        n = 1
        s = 0
        for sub in tree.sub
            s, n = sumpath_numver(sub)
            s += s 
            n += n 
        end
        return s, n 
    end

    s, n = sumpath_numver()
    return s / n
end
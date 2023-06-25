function pow(a, n)
  	b = a
    p = 1
    k = n
  
    while k > 0
    		if k % 2 === 0
      			k = k / 2
      			b = b * b
         else
      			k = k - 1
      			p = p * b
        end
		end
  	return p
end


const b = [BigInt(1) 1; 1 0]

function fib(n)
    return n ≤ 2 ? one(n) : (pow(b, n + 1))[2, 2]
end
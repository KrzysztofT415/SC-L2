#!/usr/bin/julia
#=
 - Author: Krzysztof Tałałaj
=#

using ChangePrecision

function p(n, r, p0)
    if  n <= 0  return p0  end
    m = p(n - 1, r, p0)
    println(m)
    return m + r * m * (1 - m)
end

@changeprecision Float32 begin
    println("normal= ", p(30, 3, 0.01))
    println("paused= ", p(30, 3, floor(p(10, 3, 0.01); digits = 3)))
    println("--------------------")
    println("Float32= ", p(40, 3, 0.01))
end
@changeprecision Float64 begin
    println("Float64= ", p(40, 3, 0.01))
end

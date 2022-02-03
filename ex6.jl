#!/usr/bin/julia
#=
 - Author: Krzysztof Tałałaj
=#

using ChangePrecision

function x(n, c, x0)
    if  n <= 0  return x0  end
    m = x(n - 1, c, x0)
    println(m)
    return m^2 + c
end

@changeprecision Float64 begin
    println("(-2, 1)= ", x(40, -2, 1), '\n')
    println("(-2, 2)= ", x(40, -2, 2), '\n')
    println("(-2, 1.99999999999999)= ", x(40, -2, 1.99999999999999), '\n')
    println("(-1, 1)= ", x(40, -1, 1), '\n')
    println("(-1, -1)= ", x(40, -1, -1), '\n')
    println("(-1, 0.75)= ", x(40, -1, 0.75), '\n')
    println("(-1, 0.25)= ", x(40, -1, 0.25), '\n')
end

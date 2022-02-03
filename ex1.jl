#!/usr/bin/julia
#=
 - Author: Krzysztof Tałałaj
=#

using ChangePrecision
import Base.sort

x = [2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
real = -1.00657107000000e-11

algorithmA(array) = sum(array)
algorithmB(array) = sum(reverse(array))
algorithmC(array) = sum(sort(array[array.<0])) + sum(sort(array[array.>=0], rev=true))
algorithmD(array) = sum(sort(array[array.<0], rev=true)) + sum(sort(array[array.>=0]))

types = [Float32, Float64]
for type in types
    @changeprecision type begin
        multiplied = type[type(x[n]) * type(y[n]) for n in 1:5]
        println("\n", type, " :")
        println("multiplied= ", multiplied)
        println("negative= ", sort(multiplied[multiplied.<0]))
        println("positive= ", sort(multiplied[multiplied.>=0]))
        println(" A= ", algorithmA(multiplied))
        println(" B= ", algorithmB(multiplied))
        println(" C= ", algorithmC(multiplied))
        println(" D= ", algorithmD(multiplied))
        println(" real= ", real)
    end
end

#!/usr/bin/julia
#=
 - Author: Krzysztof Tałałaj
=#

using ChangePrecision
using LinearAlgebra

function hilb(n::Int)
    if  n < 1  error("size n should be >= 1")  end
    return [1 / (i + j - 1) for i in 1:n, j in 1:n]
end

function matcond(n::Int, c::Float64)
    if  n < 2  error("size n should be > 1")  end
    if  c < 1.0  error("condition number  c of a matrix  should be >= 1.0")  end
    (U,S,V) = svd(rand(n,n))
    return U * diagm(0 =>[LinRange(1.0,c,n);]) * V'
end

function testMatrix(A::Matrix, n)
    x = ones(n)
    b = sum(A, dims=2)
    gauss = A \ b
    inversion = inv(A) * b
#     println(" gauss= ", gauss)
    println(" dg= ", norm(gauss - x)/norm(x))
#     println(" inversion= ", inversion)
    println(" di= ", norm(inversion - x)/norm(x))
end

@changeprecision Float64 begin
    for n in 2:10
        println("hilb n= ", n)
        testMatrix(hilb(n), n)
    end
    for n in [5 10 20], c in [0 1 3 7 12 16]
        println("metcond n= ", n, " c= ", c)
        testMatrix(matcond(n,Float64(10^c)), n)
    end
end

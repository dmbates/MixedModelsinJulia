function rcond(A::LowerTriangular{Float64, Matrix{Float64}})
    n = LinAlg.checksquare(A)
    n == 1 && return A[1,1] == 0 ? 0.0 : 1.0
    work = Array(Float64, (3n,))
    iwork = Array(Int, (n,))
    info = zeros(Int, 1)
    rc = zeros(1)
    ccall(("dtrcon_", Base.liblapack_name), Void,
        (Ptr{UInt8}, Ptr{UInt8}, Ptr{UInt8}, Ref{Int}, Ptr{Float64}, Ref{Int}, Ptr{Float64},
        Ptr{Float64}, Ptr{Int}, Ptr{Int}),
        "1", "L", "N", n, A.data, n, rc, work, iwork, info)
    info[1] == 0 || error("dtrcon_ returned error code $(info[1])")
    return rc[1]
end

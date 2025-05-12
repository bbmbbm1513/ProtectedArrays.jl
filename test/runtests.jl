using ProtectedArrays
using Test, TestSetExtensions, SafeTestsets

@testset ExtendedTestSet "ProtectedArrays.jl" begin
    @safetestset "Constructors" begin
        using ProtectedArrays

        a = [1, 2]
        pa = protect(a)
        @test unprotect(pa) === a
        @test parent(pa) === a
        @test isa(pa, ProtectedArray{Int,1,Vector{Int}})
        @test isa(pa, ProtectedArray{Int,1})
        @test isa(pa, ProtectedArray{Int})
        @test isa(pa, ProtectedArray)
        @test isa(pa, ProtectedVector{Int,Vector{Int}})
        @test isa(pa, ProtectedVector{Int})
        @test isa(pa, ProtectedVector)

        a = [1 2 3; 4 5 6]
        pa = protect(a)
        @test unprotect(pa) === a
        @test parent(pa) === a
        @test isa(pa, ProtectedArray{Int,2,Matrix{Int}})
        @test isa(pa, ProtectedArray{Int,2})
        @test isa(pa, ProtectedArray{Int})
        @test isa(pa, ProtectedArray)
        @test isa(pa, ProtectedMatrix{Int,Matrix{Int}})
        @test isa(pa, ProtectedMatrix{Int})
        @test isa(pa, ProtectedMatrix)

        a = reshape(collect(1:24), (2,3,4))
        pa = protect(a)
        @test unprotect(pa) === a
        @test parent(pa) === a
        @test isa(pa, ProtectedArray{Int,3,Array{Int,3}})
        @test isa(pa, ProtectedArray{Int,3})
        @test isa(pa, ProtectedArray{Int})
        @test isa(pa, ProtectedArray)
    end

    @testset "Interfaces" begin
        @safetestset "Iteration" begin end
        @safetestset "Indexing" begin
            using ProtectedArrays

            err_msg = "`ProtectedArray` does not allow modifying elements with `setindex!`"

            a = [1, 2, 3, 4, 5, 6]
            a_backup = copy(a)
            pa = protect(a)
            for i in 1:6
                @test pa[i] == i
            end
            for i in 1:6
                @test_throws err_msg pa[i] = 0
            end
            @test_throws err_msg pa .= 0
            @test_throws err_msg reverse!(pa)
            @test_throws MethodError push!(pa, 0)
            @test_throws MethodError pushfirst!(pa, 0)
            @test_throws MethodError pop!(pa)
            @test_throws MethodError popat!(pa, 3)
            @test_throws MethodError popfirst!(pa)
            @test_throws MethodError insert!(pa, 3, 0)
            @test_throws MethodError splice!(pa, 3, 0)
            @test_throws MethodError deleteat!(pa, 3)
            @test_throws MethodError resize!(pa, 3)
            @test parent(pa) === a
            @test parent(pa) == a_backup

            a = [1 3 5; 2 4 6]
            a_backup = copy(a)
            pa = protect(a)
            for i in 1:6
                @test pa[i] == i
            end
            for i in 1:6
                @test_throws err_msg pa[i] = 0
            end
            @test_throws err_msg pa .= 0
            @test_throws err_msg reverse!(pa)
            @test parent(pa) === a
            @test parent(pa) == a_backup
        end
        @safetestset "Abstract array" begin end
        @safetestset "Strided array" begin end
    end
end

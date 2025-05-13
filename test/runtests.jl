using ProtectedArrays
using Test, TestSetExtensions, SafeTestsets

@testset ExtendedTestSet "All tests" begin

    @safetestset "Aqua tests" include("Aqua.jl")

    @testset "ProtectedArrays.jl" begin

        @safetestset "Constructors" include("test_constructors.jl")

        @testset "Interfaces" begin
            @safetestset "Iteration" include("test_iteration.jl")
            @safetestset "Indexing" include("test_indexing.jl")
            @safetestset "Abstract array" begin end
            @safetestset "Strided array" begin end
        end

        @safetestset "Modification" include("test_modification.jl")

    end # ProtectedArrays.jl
end # All tests

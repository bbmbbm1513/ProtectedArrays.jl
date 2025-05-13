using ProtectedArrays
using Test, TestSetExtensions, SafeTestsets

@testset ExtendedTestSet "All tests" begin

    @safetestset "Aqua tests" include("Aqua.jl")

    @testset "ProtectedArrays.jl" begin

        @safetestset "Constructors" include("test_constructors.jl")

        @testset "Interfaces" begin
            @safetestset "Iteration" include("test_iteration.jl")
            @safetestset "Indexing" include("test_indexing.jl")
            @safetestset "Strided array" begin end
            @safetestset "Abstract array" include("test_abstract_array.jl")
        end

        @safetestset "Modification" include("test_modification.jl")

    end # ProtectedArrays.jl
end # All tests

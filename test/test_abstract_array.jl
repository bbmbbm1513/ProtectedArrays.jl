using ProtectedArrays
using OffsetArrays, StaticArrays, RecursiveArrayTools

function test_abstract_array(a::AbstractArray)
    @testset "$(a)" begin
        backup = deepcopy(a)
        pa = protect(a)

        @test ndims(pa) == ndims(a)

        @test IndexStyle(pa) == IndexStyle(a)
        @test axes(pa) == axes(a)
        for d in 1:3
            @test axes(pa, d) == axes(a, d)
        end

        @test parent(pa) === a
        @test parent(pa) == backup
    end
end

test_abstract_array([1,2,3,4,5,6])
test_abstract_array(OffsetArray([1,2,3,4,5,6], 10))
test_abstract_array(SArray{Tuple{6}}([1,2,3,4,5,6]))
test_abstract_array(MArray{Tuple{6}}([1,2,3,4,5,6]))
test_abstract_array(ArrayPartition([1,2,3], [4,5,6]))

test_abstract_array([1 2 3; 4 5 6])
test_abstract_array(OffsetArray([1 2 3; 4 5 6], (100, 10)))
test_abstract_array(SArray{Tuple{2,3}}([1 2 3; 4 5 6]))
test_abstract_array(MArray{Tuple{2,3}}([1 2 3; 4 5 6]))

test_abstract_array(transpose([1 2 3; 4 5 6]))
test_abstract_array(transpose(OffsetArray([1 2 3; 4 5 6], (100, 10))))
test_abstract_array(transpose(SArray{Tuple{2,3}}([1 2 3; 4 5 6])))
test_abstract_array(transpose(MArray{Tuple{2,3}}([1 2 3; 4 5 6])))

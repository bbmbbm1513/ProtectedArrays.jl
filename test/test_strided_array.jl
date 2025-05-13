using ProtectedArrays
using OffsetArrays, StaticArrays, RecursiveArrayTools

function test_strided_array(a::AbstractArray)
    @testset "$(a)" begin
        backup = deepcopy(a)
        pa = protect(a)

        @test Base.elsize(pa) == Base.elsize(a)
        @test strides(pa) == strides(a)
        for d in 1:ndims(a)
            @test stride(pa, d) == stride(a, d)
        end

        @test parent(pa) === a
        @test parent(pa) == backup
    end
end

test_strided_array([1,2,3,4,5,6])
test_strided_array(OffsetArray([1,2,3,4,5,6], 10))
# test_strided_array(SArray{Tuple{6}}([1,2,3,4,5,6]))
test_strided_array(MArray{Tuple{6}}([1,2,3,4,5,6]))
# test_strided_array(ArrayPartition([1,2,3], [4,5,6]))

test_strided_array([1 2 3; 4 5 6])
test_strided_array(OffsetArray([1 2 3; 4 5 6], (100, 10)))
# test_strided_array(SArray{Tuple{2,3}}([1 2 3; 4 5 6]))
test_strided_array(MArray{Tuple{2,3}}([1 2 3; 4 5 6]))

test_strided_array(transpose([1 2 3; 4 5 6]))
test_strided_array(transpose(OffsetArray([1 2 3; 4 5 6], (100, 10))))
# test_strided_array(transpose(SArray{Tuple{2,3}}([1 2 3; 4 5 6])))
test_strided_array(transpose(MArray{Tuple{2,3}}([1 2 3; 4 5 6])))

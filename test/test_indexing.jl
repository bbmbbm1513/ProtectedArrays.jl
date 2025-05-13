using ProtectedArrays

const err_msg = "`ProtectedArray` does not allow modifying elements with `setindex!`"

a = [1, 2, 3, 4, 5, 6]
a_backup = copy(a)
pa = protect(a)
for i in 1:6
    @test pa[i] == i
end
for i in 1:6
    @test_throws err_msg pa[i] = 0
end
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

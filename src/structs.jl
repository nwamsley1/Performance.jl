export DefaultArray, size, getindex, setindex!, eltype
# This implements an array that returns a "default" value when
# accessed out of bounds. Example:
#     a = DefaultArray([1.0, 2.0], NaN)
#     a[1]   # returns 1.0
#     a[5]   # returns NaN (does not throw a BoundsError)
# However, this is a deliberately "amateurish" implementation
# and it has numerous deficiencies.

# To solve this problem, you'll have to improve the `struct` definition and modify/add constructors
# Hint: every aspect of the struct definition should be improved (not just the fields)
struct DefaultArray{T, N} <: AbstractArray{T,N}
    parentarray::Array{T, N}
    defaultvalue::T
end
import Base.size, Base.getindex, Base.setindex!, Base.eltype
Base.size(A::DefaultArray) = Base.size(A.parentarray)
Base.getindex(a::DefaultArray, i::Vararg{Int,N}) where N = checkbounds(Bool, a, i...) ? a.parentarray[i...] : a.defaultvalue
#Base.getindex(A::DefaultArray, I::Vararg{Int, N}) = Base.getindex(A.parentarray, I)
Base.setindex!(A::DefaultArray, v, i::Int) = Base.setindex!(A.parentarray, v, i)
#Base.eltype(A::DefaultArray) = Union{typeof(A.defaultvalue), eltype(A.parentarray)}
#Base.setindex!(A::DefaultArray, v, I::Vararg{Int, N}) = Base.setindex!(A.parentarray, v, I)
#DefaultArray(parentarray, defaultvalue) = DefaultArray{promote_type(eltype(parentarray), typeof(defaultvalue)), typndims(parentarray), promote_type(eltype(parentarray), typeof(defaultvalue))}(parentarray, defaultvalue)
DefaultArray(parentarray, defaultvalue) = DefaultArray{promote_type(eltype(parentarray), typeof(defaultvalue)), ndims(parentarray)}(parentarray, defaultvalue)
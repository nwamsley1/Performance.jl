export sequence_of_three, alternate_items

function sequence_of_three(start)
    out = typeof(start)[]
    push!(out, start, start+1, start+2)
    return out
end

function alternate_items(nrepeats::Integer, item1::Int64, item2::Int64)
    out = Int64[]
    for _ = 1:nrepeats           # _ is often used for a variable you'll not use again
        push!(out, item1, item2)
    end
    return out
end

function alternate_items(nrepeats::Integer, item1::Missing, item2::Int64)
    out = Union{Int64, Missing}[]
    for _ = 1:nrepeats           # _ is often used for a variable you'll not use again
        push!(out, item1, item2)
    end
    return out
end

alternate_items(nrepeats::Integer, item1::Int64, item2::Missing) = alternate_items(nrepeats, item2, item1)
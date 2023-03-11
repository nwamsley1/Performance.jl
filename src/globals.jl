export getchar, set_homedir, get_homedir

charset::StepRange{Char, Int64} = 'a':'z'

getchar(idx) = charset[idx]

homedir::Ref{String} = Ref("wrong")

function set_homedir(path)
    global homedir = Ref{String}(path)
end

get_homedir()::String = homedir[]


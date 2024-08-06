function vector_save(filepath, v::Vector)
    open(filepath, "w") do fp
        write(fp, v)
    end
end


function sieve_write(filepath, type)
    @time n, v = primesieve(typemax(type))
    vector_save(filepath, v)
    n
end

function vector_load(filepath, type)
    fp = open(filepath, "r")
    length, tmp_rem = divrem(filesize(filepath), sizeof(type))
    @assert tmp_rem == 0
    v = zeros(type, length)
    for i in 1:length
        v[i] = read(fp, type)
    end
    close(fp)
    v
end

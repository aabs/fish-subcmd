function __fd2_define_command_completion 
    argparse 'p/=+' 'd/=+' -- $argv

    set prefix ''
    if test -z $_flag_p
        error "__fd2_define_command_completion: prefix must be set (use the -p option)" >&2
        return 1
    else
        set prefix $_flag_p
    end

    set description ''
    if test -z $_flag_d
        error "__fd2_define_command_completion: description must be set (use the -d option)" >&2
        return 1
    else
        set description $_flag_d
    end



    trace __fd2_define_command_completion $prefix >&2

    complete -x -c "$prefix" -d "$description"
end

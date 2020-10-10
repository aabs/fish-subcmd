function __fd2_define_subcommand_completion 
    argparse 'c/=+' 'p/=+' 'd/=+' -- $argv

    set command_name ''
    if test -z $_flag_c
        error "__fd2_define_subcommand_completion: command_name must be set (use the -c option)" >&2
        return 1
    else
        set command_name $_flag_c
    end

    set prefix ''
    if test -z $_flag_p
        error "__fd2_define_subcommand_completion: prefix must be set (use the -p option)" >&2
        return 1
    else
        set prefix $_flag_p
    end

    set description ''
    if test -z $_flag_d
        error "__fd2_define_subcommand_completion: description must be set (use the -d option)" >&2
        return 1
    else
        set description $_flag_d
    end

    trace "__fd2_define_subcommand_completion $prefix $command_name" >&2

    complete -x -c "$prefix" -a "$command_name" -d "$description"
end


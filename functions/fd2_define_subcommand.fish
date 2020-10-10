function fd2_define_subcommand -d "create a command prefix"
    set command_name ''
    set function_name ''
    set prefix ''
    set description ''

    argparse 'c/=+' 'f/=+' 'p/=+' 'd/=+' -- $argv

    if test -z $_flag_c
        error "fd2_define_subcommand: command_name must be set (use the -c option)" >&2
        return 1
    else
        set command_name $_flag_c
    end

    if test -z $_flag_f
        error "fd2_define_subcommand: function_name must be set (use the -f option)" >&2
        return 1
    else
        set function_name $_flag_f
    end

    if test -z $_flag_p
        error "fd2_define_subcommand: prefix must be set (use the -p option)" >&2
        return 1
    else
        set prefix $_flag_p
    end

    if test -z $_flag_d
        error "fd2_define_subcommand: desc must be set (use the -d option)" >&2
        return 1
    else
        set description $_flag_d
    end

    trace fd2_define_subcommand $prefix $command_name >&2
    __fd2_define_subcommand -p $prefix -c $command_name -f $function_name -d $description
    __fd2_define_subcommand_completion -p $prefix -c $command_name -d $description
end


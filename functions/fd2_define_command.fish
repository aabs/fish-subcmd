function fd2_define_command -d "create a command prefix"

    set prefix ''
    set desc ''

    argparse 'p/=+' 'd/=+' -- $argv

    if test -z $_flag_p
        error "__fd2_define_command: prefix must be set (use the -p option)" >&2
        return 1
    else
        set prefix $_flag_p
    end

    if test -z $_flag_d
        error "__fd2_define_command: desc must be set (use the -d option)" >&2
        return 1
    else
        set desc $_flag_d
    end


    trace fd2_define_command $prefix
    __fd2_define_command -p $prefix -d $desc
    __fd2_define_command_completion -p $prefix -d $desc
    __fd2_define_command_dispatcher $prefix

    __fd2_define_help_subcommand $prefix
end


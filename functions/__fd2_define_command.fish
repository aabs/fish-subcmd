function __fd2_define_command -d "create a command prefix"

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


    trace __fd2_define_command $prefix >&2
    eval "set -e _subcommand_names_$prefix"
    if not contains $prefix $_command_names
        set -U _command_names $_command_names $prefix
        eval "set -U _command_summary_$prefix '$desc'"
    end
end

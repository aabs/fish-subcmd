function __fd2_define_subcommand -d "create a command prefix impl"
    argparse 'c/=+' 'p/=+' 'd/=+' 'f/=+' -- $argv

    set command_name ''
    if test -z $_flag_c
        error "__fd2_define_subcommand: command_name must be set (use the -c option)" >&2
        return 1
    else
        set command_name $_flag_c
    end

    set prefix ''
    if test -z $_flag_p
        error "__fd2_define_subcommand: prefix must be set (use the -p option)" >&2
        return 1
    else
        set prefix $_flag_p
    end

    set description ''
    if test -z $_flag_d
        error "__fd2_define_subcommand: description must be set (use the -d option)" >&2
        return 1
    else
        set description $_flag_d
    end
    set function_name ''
    if test -z $_flag_f
        error "__fd2_define_subcommand: function_name must be set (use the -e option)" >&2
        return 1
    else
        set function_name $_flag_f
    end

    # erase definitions for event and description
    eval "set -e _subcommand_function_"$prefix"_"$command_name
    eval "set -e _subcommand_summary_"$prefix"_"$command_name

    set -l x "_subcommand_names_$prefix"
    eval "set -U $x \$$x $command_name"
    eval "set -U _subcommand_function_"$prefix"_"$command_name" '$function_name'"
    eval "set -U _subcommand_summary_"$prefix"_"$command_name" '$description'"
end


function __fd2_define_subcommand_evented -d "create a command prefix impl"
    argparse 'c/=+' 'p/=+' 'd/=+' 'e/=+' -- $argv

    set command_name ''
    if test -z $_flag_c
        error "__fd2_define_subcommand_evented: command_name must be set (use the -c option)" >&2
        return 1
    else
        set command_name $_flag_c
    end

    set prefix ''
    if test -z $_flag_p
        error "__fd2_define_subcommand_evented: prefix must be set (use the -p option)" >&2
        return 1
    else
        set prefix $_flag_p
    end

    set description ''
    if test -z $_flag_d
        error "__fd2_define_subcommand_evented: description must be set (use the -d option)" >&2
        return 1
    else
        set description $_flag_d
    end
    set event_name ''
    if test -z $_flag_e
        error "__fd2_define_subcommand_evented: event_name must be set (use the -e option)" >&2
        return 1
    else
        set event_name $_flag_e
    end

    # erase definitions for event and summary
    eval "set -e _subcommand_event_"$prefix"_"$command_name
    eval "set -e _subcommand_summary_"$prefix"_"$command_name

    set -l x "_subcommand_names_$prefix"
    eval "set -U $x \$$x $command_name"
    eval "set -U _subcommand_event_"$prefix"_"$command_name" '$event_name'"
    eval "set -U _subcommand_summary_"$prefix"_"$command_name" '$description'"
end


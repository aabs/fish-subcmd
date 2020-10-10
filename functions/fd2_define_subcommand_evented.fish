function fd2_define_subcommand_evented -d "create a command prefix"
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

  trace fd2_define_subcmd_evented a prefix: $prefix subcmd: $command_name event: $event_name
  __fd2_define_subcommand_evented -p $prefix -c $command_name -e $event_name -d $description
  __fd2_define_subcommand_completion  -p $prefix -c $command_name -d $description
end

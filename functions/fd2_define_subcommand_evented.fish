function fd2_define_subcommand_evented -d "create a command prefix"
    set -l command_name ''
    set -l event_name ''
    set -l prefix ''
    set -l description ''

    getopts $argv | while read -l key value
        switch $key
            case p prefix
                set prefix $value
            case c command_name
                set command_name $value
            case e event_name
                set event_name $value
            case d description
                set description $value
        end
    end

    if test -z $prefix
      error "prefix must be set (use the -p option)" >&2
      return 1
    end

    if test -z $description
      error "description must be set (use the -d option)" >&2
      return 1
    end

    if test -z $event_name
      error "event name must be set (use the -e option)" >&2
      return 1
    end

    if test -z $command_name
      error "command name must be set (use the -c option)" >&2
      return 1
    end

  trace fd2_define_subcmd_evented a prefix: $prefix subcmd: $command_name event: $event_name
  __fd2_define_subcommand_evented -p $prefix -c $command_name -e $event_name -d $description
  __fd2_define_subcommand_completion  -p $prefix -c $command_name -d $description
end

function __fd2_define_subcommand_evented -d "create a command prefix impl"
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
      echo "prefix must be set (use the -p option)" >&2
      return 1
    end

    if test -z $description
      echo "description must be set (use the -d option)" >&2
      return 1
    end

    if test -z $event_name
      echo "event name must be set (use the -e option)" >&2
      return 1
    end

    if test -z $command_name
      echo "command name must be set (use the -c option)" >&2
      return 1
    end

    # erase definitions for event and summary
    eval "set -e _subcommand_event_"$prefix"_"$command_name
    eval "set -e _subcommand_summary_"$prefix"_"$command_name

    set -l x "_subcommand_names_$prefix"
    eval "set -U $x \$$x $command_name"
    eval "set -U _subcommand_event_"$prefix"_"$command_name" '$event_name'"
    eval "set -U _subcommand_summary_"$prefix"_"$command_name" '$description'"
end


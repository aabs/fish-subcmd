function __fd2_define_subcommand_completion -a prefix subcmd summary
    set -l command_name ''
    set -l prefix ''
    set -l desc ''

    getopts $argv | while read -l key value
        switch $key
            case p prefix
                set prefix_name $value
            case c command_name
                set command_name $value
            case d desc
                set summary $value
        end
    end

    if test -z $prefix_name
      echo "prefix must be set (use the -p option)" >&2
      return 1
    end

    if test -z $summary
      echo "description must be set (use the -d option)" >&2
      return 1
    end

    if test -z $command_name
      echo "command name must be set (use the -c option)" >&2
      return 1
    end

    fd2_echo "__fd2_define_subcommand_completion $prefix $subcmd" >&2

    complete -x -c "$prefix" -a "$command_name" -d "$summary"
end


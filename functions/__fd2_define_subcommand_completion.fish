function __fd2_define_subcommand_completion 
    set -l command_name ''
    set -l prefix ''
    set -l description ''

    getopts $argv | while read -l key value
        switch $key
            case p prefix
                set prefix $value
            case c command_name
                set command_name $value
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

    if test -z $command_name
      echo "command name must be set (use the -c option)" >&2
      return 1
    end

    fd2_echo "__fd2_define_subcommand_completion $prefix $command_name" >&2

    complete -x -c "$prefix" -a "$command_name" -d "$description"
end


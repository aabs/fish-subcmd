function fd2_define_subcommand -d "create a command prefix"
    set -l command_name ''
    set -l function_name ''
    set -l prefix ''
    set -l desc ''

    getopts $argv | while read -l key value
        switch $key
            case p prefix
                set prefix_name $value
            case c command_name
                set command_name $value
            case f function_name
                set function_name $value
            case d desc
                set description $value
        end
    end

    if test -z $prefix_name
      error "prefix must be set (use the -p option)" >&2
      return 1
    end

    if test -z $description
      error "description must be set (use the -d option)" >&2
      return 1
    end

    if test -z $function_name
      error "function name must be set (use the -f option)" >&2
      return 1
    end

    if test -z $command_name
      error "command name must be set (use the -c option)" >&2
      return 1
    end

  trace fd2_define_subcommand $prefix_name $command_name >&2
  __fd2_define_subcommand -p $prefix_name -c $command_name -f $function_name -d $description
  __fd2_define_subcommand_completion -p $prefix_name -c $command_name -d $description
end


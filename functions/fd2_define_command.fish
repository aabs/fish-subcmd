function fd2_define_command -d "create a command prefix"

    set -l prefix ''
    set -l desc ''

    echo fd2_define_command $prefix >&2

    getopts $argv | while read -l key value
        switch $key
            case p prefix
                set prefix $value
            case d desc
                set desc $value
        end
    end
    if test -z $prefix
      echo "prefix must be set (use the -p option)" >&2
      return 1
    end
    if test -z $desc
      echo "description must be set (use the -d option)" >&2
      return 1
    end


    echo fd2_define_command $prefix
    __fd2_define_command -p $prefix -d $desc
    __fd2_define_command_completion -p $prefix -d $desc
    __fd2_define_command_dispatcher $prefix

    __fd2_define_help_subcommand $prefix
end


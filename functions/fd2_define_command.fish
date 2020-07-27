function fd2_define_command -d "create a command prefix"

    set -l prefix ''
    set -l desc ''

    trace fd2_define_command $prefix >&2

    getopts $argv | while read -l key value
        switch $key
            case p prefix
                set prefix $value
            case d desc
                set desc $value
        end
    end
    if test -z $prefix
      error "prefix must be set (use the -p option)" >&2
      return 1
    end
    if test -z $desc
      error "description must be set (use the -d option)" >&2
      return 1
    end


    trace fd2_define_command $prefix
    __fd2_define_command $prefix $desc
    __fd2_define_command_completion $prefix $desc
    __fd2_define_command_dispatcher $prefix

    __fd2_define_help_subcommand $prefix
end


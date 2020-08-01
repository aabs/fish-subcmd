function __fd2_define_command_completion 
    set -l prefix ''
    set -l description ''

    getopts $argv | while read -l key value
        switch $key
            case p prefix
                set prefix $value
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

    trace __fd2_define_command_completion $prefix >&2

    complete -x -c "$prefix" -d "$description"
end

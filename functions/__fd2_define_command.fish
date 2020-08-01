function __fd2_define_command -d "create a command prefix"
    set -l prefix ''
    set -l desc ''

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

  trace __fd2_define_command $prefix >&2
  eval "set -e _subcommand_names_$prefix"
  if not contains $prefix $_command_names
      set -U _command_names $_command_names $prefix
      eval "set -U _command_summary_$prefix '$desc'"
  end
end

function __fd2_define_command  -a prefix_name summary -d "create a command prefix"
  eval "set -e _subcommand_names_$prefix_name"
  if not contains $prefix_name $_command_names
      set -U _command_names $_command_names $prefix_name
      eval "set -U _command_summary_$prefix_name '$summary'"
  end
end

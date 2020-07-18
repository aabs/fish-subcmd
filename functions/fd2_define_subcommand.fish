function fd2_define_subcommand -a prefix_name command_name function_name summary -d "create a command prefix"
  trace fd2_define_subcommand $prefix_name $command_name
  __fd2_define_subcommand $prefix_name $command_name $function_name $summary
  __fd2_define_subcommand_completion $prefix_name $command_name $summary
end


function fd2_define_subcmd -a prefix_name command_name function_name summary -d "create a command prefix"
    __fd2_define_subcommand $prefix_name $command_name $function_name $summary
    __fd2_define_subcommand_completion $prefix_name $command_name $summary
end


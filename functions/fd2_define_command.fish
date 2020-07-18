function fd2_define_command -a prefix_name summary -d "create a command prefix"
    __fd2_define_command $prefix_name $summary
    __fd2_define_command_completion $prefix_name $summary
    __fd2_define_command_dispatcher $prefix_name

    __fd2_define_help_subcommand $prefix_name
end


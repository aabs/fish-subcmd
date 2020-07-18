function fd2_define_subcmd_evented -a prefix_name command_name event_name summary -d "create a command prefix"
  trace fd2_define_subcmd_evented a prefix: $prefix_name subcmd: $command_name event: $event_name
    __fd2_define_subcommand_evented $prefix_name $command_name $event_name $summary
    __fd2_define_subcommand_completion  $prefix_name $command_name $summary
end

function __fd2_define_subcommand_evented -a prefix_name command_name event_name summary -d "create a command prefix impl"
    # erase definitions for event and summary
    eval "set -e _subcommand_event_"$prefix_name"_"$command_name
    eval "set -e _subcommand_summary_"$prefix_name"_"$command_name

    set -l x "_subcommand_names_$prefix_name"
    eval "set -U $x \$$x $command_name"
    eval "set -U _subcommand_event_"$prefix_name"_"$command_name" '$event_name'"
    eval "set -U _subcommand_summary_"$prefix_name"_"$command_name" '$summary'"
end


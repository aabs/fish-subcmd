function __fd2_define_help_subcommand -a prefix_name
    set -l ev $prefix_name"_help"
    __fd2_define_subcommand $prefix_name "help" $ev "Display help for command $prefix_name"

    # create an event handler for displaying the help for this command
    eval 'function '$ev' ; __fd2_display_command_help_for '$prefix_name'; end'
end


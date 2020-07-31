function __fd2_define_help_subcommand -a prefix_name
    set -l fun $prefix_name"_help"
    __fd2_define_subcommand -p $prefix_name -c "help" -f $fun -d "Display help for command $prefix_name"

    # create an event handler for displaying the help for this command
    eval 'function '$fun' ; __fd2_display_command_help_for '$prefix_name'; end'
end


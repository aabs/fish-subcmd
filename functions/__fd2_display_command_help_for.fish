function __fd2_display_command_help_for -a prefix_name -d "display usage text for command"
    set -l x "_subcommand_names_$prefix_name"
    set -l cmd_summary "_command_summary_$prefix_name"
    set -l header "Command Usage for $prefix_name"
    echo $header
    __fd2_underline $header '-'
    echo $$cmd_summary
    echo
    echo $prefix_name" <command> [options] [args]"
    echo

    for subcommand in $$x
        set -l y "_subcommand_summary_"$prefix_name"_"$subcommand
        echo -e "$prefix_name $subcommand\t"$$y
    end

end


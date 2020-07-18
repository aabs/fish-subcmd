function __fd2_define_command_dispatcher -a prefix -d "creates a function to dispatch subcommands for top level command"

    function __fd2_dispatch_ -a prefix
        set -l argcount (count $argv)

        if test 1 -eq $argcount
            __fd2_display_command_help_for $prefix
            return
        end

        set -l subcmds "_subcommand_names_$prefix"
        set -l sub $argv[2]
        set -l rest $argv[3..8]
        set -l ev "_subcommand_event_"$prefix"_$sub"
        if set -q $ev
            eval "emit $$ev $rest"
        end
        set -l fn "_subcommand_function_"$prefix"_$sub"
        if set -q $fn
            eval "$$fn $rest"
        end
    end

    eval 'function '$prefix' ; __fd2_dispatch_ '$prefix' $argv; end'
end

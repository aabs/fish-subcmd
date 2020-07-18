function __fd2_define_subcommand_completion -a prefix subcmd summary
    complete -x -c "$prefix" -a "$subcmd" -d "$summary"
end


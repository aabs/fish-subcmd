function __fd2_define_command_completion -a prefix summary
    complete -x -c "$prefix" -d "$summary"
end

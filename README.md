# fish sub command

A simple fish plugin providing functions to build multi-level commands.  It's easier to show how it works than to explain:

```fish
fd2_define_command tm "fishdots plugin for using tmux"

fd2_define_subcommand tm set __fd2_tm_set "set current TMUX session"
fd2_define_subcommand tm new __fd2_tm_new "<session_name> create a new TMUX session"
fd2_define_subcommand tm detach __fd2_tm_detach "disconnect from the current session"
fd2_define_subcommand tm goto __fd2_tm_goto "<name> change tmux sessions"
fd2_define_subcommand tm home __fd2_tm_home "got to the current home tmux session"
fd2_define_subcommand tm ls __fd2_tm_list "list all available tmuxers"
fd2_define_subcommand tm open __fd2_tm_open "open from list dialog"
fd2_define_subcommand tm session __fd2_tm_session "display the current session name"
```
this creates a little function called `tm` that acts as a command dispatcher.  If you use it on its own, it displays some standard help text:

```shell
$ tm

Command Usage for tm
--------------------
fishdots plugin for using tmux

tm <command> [options] [args]

tm help Display help for command tm
tm set  set current TMUX session
tm new  <session_name> create a new TMUX session
tm detach       disconnect from the current session
tm goto <name> change tmux sessions
tm home got to the current home tmux session
tm ls   list all available tmuxers
tm open open from list dialog
tm session      display the current session name
```

Command completions are also populated for the sub-commands as well:

```shell
$ tm <TAB>
d235108@nsda3bpldv45 ~> tm session

detach  (disconnect from the current session)    home  (got to the current home tmux session)  
new  (<session_name> create a new TMUX session)  session  (display the current session name)
goto            (<name> change tmux sessions)    ls              (list all available tmuxers)  
open                    (open from list dialog)  set              (set current TMUX session)
```

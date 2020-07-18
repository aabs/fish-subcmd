function __fd2_underline -a str ul -d "create an underlined version of a string"
    for i in (seq 1 (string length $str))
        echo -n $ul
    end
    echo
end


if status is-interactive
    function fish_greeting
        echo Today is (set_color yellow; date "+%A %B %d"; set_color normal)
        echo
        /usr/bin/pfetch
        echo
    end
end

function doctor
    echo "🔍 Fish Environment Doctor"
    echo --------------------------

    # # PATH
    # echo "PATH:"
    # string split : $PATH | sed 's/^/  - /'

    # Node
    if type -q node
        echo "✔ node: "(node -v)
    else
        echo "✖ node not found"
    end

    if type -q npm
        echo "✔ npm: "(npm -v)
    else
        echo "✖ npm not found"
    end

    # fnm
    if type -q fnm
        echo "✔ fnm: "(fnm --version)
    else
        echo "✖ fnm not found"
    end

    # Bun
    if type -q bun
        echo "✔ bun: "(bun --version)
    else
        echo "✖ bun not found"
    end

    # Rust
    if type -q cargo
        echo "✔ cargo: "(cargo --version)
    else
        echo "✖ cargo not found"
    end

    # Go
    if type -q go
        echo "✔ go: "(go version)
    else
        echo "✖ go not found"
    end

    # Vim
    if type -q vim
        echo "✔ vim: "(vim --version | head -1)
    else
        echo "✖ vim not found"
    end

    # Neovim / LSP
    if type -q nvim
        echo "✔ nvim: "(nvim --version | head -1)
    else
        echo "✖ nvim not found"
    end

    # Tmux
    if type -q tmux
        if set -q TMUX
            echo "✔ tmux: "(tmux -V)" (inside session)"
        else
            echo "✔ tmux: "(tmux -V)" (not in session)"
        end
    else
        echo "✖ tmux not found"
    end

    # Yazi
    if type -q yazi
        echo "✔ yazi: "(yazi --version)
    else
        echo "✖ yazi not found"
    end

    # Search tools
    if type -q fzf
        echo "✔ fzf: "(fzf --version | head -n1)
    else
        echo "✖ fzf not found"
    end

    if type -q rg
        echo "✔ rg: "(rg --version | head -n1)
    else
        echo "✖ rg not found"
    end

    if type -q fd
        echo "✔ fd: "(fd --version)
    else
        echo "✖ fd not found"
    end

    if type -q git
        echo "✔ git: "(git --version)
    else
        echo "✖ git not found"
    end

    if type -q lazygit
        echo "✔ lazygit: "(lazygit --version | grep -o 'version=[^,]*' | head -n1)
    else
        echo "✖ lazygit not found"
    end

    if type -q docker
        echo "✔ docker: "(docker --version)
    else
        echo "✖ docker not found"
    end

    if type -q lazydocker
        echo "✔ lazydocker: "(lazydocker --version | head -n1)
    else
        echo "✖ lazydocker not found"
    end
end

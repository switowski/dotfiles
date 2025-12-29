# This function will print all custom commands that I have defined everywhere,
# so I can easily keep track and stop forgetting about a command that I've
# added 2 years ago and never used.
function commands
    echo "User functions (~/.config/fish/functions.fish):"
    echo "  killport [port]       Kill port `port`"
    echo "  ip                    Print current IP"
    echo "  fish_profile          Profile fish startup time"
    echo "  change_mac            Spoof MAC address"
    echo ''
    echo '========================================================'
    echo ''
    echo "Git aliases (/Users/switowski/workspace/dotfiles/git/.gitconfig.symlink):"
    git config --get-regexp alias
    echo ''
    echo '========================================================'
    echo ''
    echo "User aliases (/Users/switowski/workspace/dotfiles/.config/fish/aliases.fish):"
    cat /Users/switowski/workspace/dotfiles/.config/fish/aliases.fish
end

function killport --argument port --description 'Kills process on a given port'
    for pid in (lsof -i TCP:$port | awk '/LISTEN/{print $2}')
        echo -n "Found server for port $port with pid $pid: "
        kill -9 $pid; and echo "killed."; or echo "could not kill."
    end
end

function ip
    ifconfig | grep broadcast | awk '{print $2}'
end

# Get back the "sudo !!" bash function
function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

# Function to profile fish startup time - since I tend to mess it up often
function fish_profile
    fish --profile prompt.prof -ic 'fish_prompt; exit'
    sort -nk 2 prompt.prof
end

# Function to spoof my MAC address
function change_mac
    # Since I'm using the NPM package to do this in a nice way (easily randomize MAC address with 1 command),
    # let's print the help of that command
    if type -q spoof
        command spoof --help
    else
        echo "Please install spoof (npm install spoof -g)"
    end
end


function resetsd
    # Reset the streamdeck software when it's frozen
    pkill -f "Elgato Stream Deck"
    sleep 1
    open /Applications/Elgato\ Stream\ Deck.app
end

# Create a new worktree and branch from within current git directory.
function gwa
    if test (count $argv) -lt 1
        echo "Usage: gwa [branch name]" >&2
        return 1
    end

    set -l branch $argv[1]
    set -l base (basename (pwd))
    set -l path "../$base--$branch"

    git worktree add -b $branch $path
    mise trust $path
    cd $path
end

# Remove worktree and branch from within active worktree directory.
function gwd
    set -l reply
    read -l -P "Remove worktree and branch? [y/N] " reply

    if not string match -qr '^(?i:y|yes)$' -- $reply
        return 0
    end

    set -l worktree_root (git rev-parse --show-toplevel 2>/dev/null)
    if test -z "$worktree_root"
        echo "gwd: not inside a git worktree." >&2
        return 1
    end

    set -l git_common_dir (git -C "$worktree_root" rev-parse --git-common-dir 2>/dev/null)
    if test -z "$git_common_dir"
        echo "gwd: could not resolve common git dir." >&2
        return 1
    end

    if not string match -qr '^/' -- $git_common_dir
        set git_common_dir "$worktree_root/$git_common_dir"
    end

    set -l main_worktree (dirname "$git_common_dir")

    if test "$main_worktree" = "$worktree_root"
        echo "gwd: refusing to remove the main worktree." >&2
        return 1
    end

    if not git -C "$main_worktree" rev-parse --git-dir >/dev/null 2>&1
        echo "gwd: main worktree is not a git repository: $main_worktree" >&2
        return 1
    end

    set -l branch (git -C "$worktree_root" symbolic-ref --short -q HEAD 2>/dev/null)

    cd "$main_worktree"
    if test $status -ne 0
        echo "gwd: could not cd to main worktree: $main_worktree" >&2
        return 1
    end

    git -C "$main_worktree" worktree remove "$worktree_root" --force
    if test $status -ne 0
        return $status
    end

    if test -n "$branch"
        git -C "$main_worktree" branch -D "$branch"
    else
        echo "gwd: no branch found for this worktree; skipped deleting branch." >&2
    end
end

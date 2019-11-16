# This function will print all custom commands that I have defined everywhere,
# so I can easily keep track and stop forgetting about a command that I've
# added 2 years ago and never used.
function commands
  echo "User functions (~/.config/fish/functions.fish):"
  echo "  kodissh               SSH to Kodi media server"
  echo "  kodimount             Mount media server at ~/kodimount"
  echo "  kodi [type] [files]   Copy files to media server"
  echo "  killport [port]       Kill port `port`"
  echo "  subl [file | dir]     Open file or directory in Sublime"
  echo "  ip                    Print current IP"
  echo "  black [arg]           Run black in docker"
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

function kodissh --description 'SSH to the media server'
  ssh osmc@192.168.0.18
end

function kodimount --description 'Mount the media server locally'
  sshfs osmc@192.168.0.18: ~/kodimount
end

function kodi --argument-names type files --description 'Media server related functions'
  switch $type
  case m movie Movie Movies:
    set dest "/home/osmc/Movies/"
  case tv "TV Show" TV tv:
    set dest "/home/osmc/TV\ Shows/"
  case music Music:
    set dest "/home/osmc/Music/"
  case '*':
    echo "Unknown type of files. Specify m (movie), tv (TV Show) or music!"
    return 1
  end
  echo "Copying $files files to $dest"
  scp -r $files osmc@192.168.0.18:$dest
end

function subl --description 'Open Sublime Text'
  if test -d "/Applications/Sublime Text.app"
    "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" $argv
  else if test -d "/Applications/Sublime Text 2.app"
    "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" $argv
  else if test -x "/opt/sublime_text/sublime_text"
    "/opt/sublime_text/sublime_text" $argv
  else if test -x "/opt/sublime_text_3/sublime_text"
    "/opt/sublime_text_3/sublime_text" $argv
  else
    echo "No Sublime Text installation found"
  end
end

function killport --argument port --description 'Kills process on a given port'
   for pid in (lsof -i TCP:$port | awk '/LISTEN/{print $2}')
     echo -n "Found server for port $port with pid $pid: "
     kill -9 $pid; and echo "killed."; or echo "could not kill."
   end
end

function ip
  ifconfig | grep "broadcast" | awk '{print $2}'
end

# Get back the "sudo !!" bash function
function sudo
    if test "$argv" = !!
    eval command sudo $history[1]
else
    command sudo $argv
    end
end

# Run black in a docker container (doesn't mess up Python/virtualenv)
function black
    docker run -v (pwd):/code jbbarth/black $argv
end

# Function to profile fish startup time - since I tend to mess it up often
function fish_profile
  fish --profile prompt.prof -ic 'fish_prompt; exit'; sort -nk 2 prompt.prof
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

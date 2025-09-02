#============= Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end
#------------- List directory content
function ll    ; ls -al $argv ; end
function l     ; ls -al $argv ; end

#============= Shortcuts ("Why waste time say lot word when few word do trick?")
function g   ; git $argv ; end
function v   ; vim $argv ; end
function o   ; open $argv ; end
function hm  ; history merge ; end
function ta  ; tmux attach ; end
function td  ; tmux detach ; end
function be  ; bundle exec $argv ; end
function dc  ; docker-compose $argv ; end
function do  ; doctl $argv ; end
function pc  ; podman-compose $argv ; end
function k   ; kubectl $argv ; end
function i   ; type -q ipython; and ipython $argv; or uvx ipython $argv ; end  # Run IPython if it's available, otherwise use the uvx command to run IPython
function nf  ; netlify $argv ; end
function npm  ; pnpm $argv ; end # Use pnpm instead of npm, as it's better
function nnpm  ; command npm $argv ; end # For when I really need that npm package manager
function uvr ; uv run $argv ; end

#============= Git functions
function ga      ; git add $argv ; end
function gb      ; git branch $argv ; end
function gbr     ; git branch $argv ; end
function gca     ; git add -A; and git commit -av $argv; end
function gci     ; git commit $argv ; end
function gco     ; git checkout $argv ; end
function gcp     ; git cherry-pick $argv ; end
function gd      ; git diff $argv ; end
function gdi     ; git diff --no-ext-diff $argv ; end
function gds     ; git diff --staged $argv ; end
function gdss    ; git diff -s $argv ; end  # Git diff side-by-side
function gffs    ; git add --all; and git commit --amend --no-edit $argv ; end
function gfo     ; git fetch origin $argv ; end
function gl      ; git log $argv ; end
function gp      ; git push $argv ; end
function gpf     ; git push --force-with-lease $argv ; end
function gpl     ; git pull $argv ; end
function gpr     ; git pull --rebase $argv ; end
function gps     ; git push $argv ; end
function gs      ; git status $argv ; end
function gsa     ; git stash apply $argv ; end
function gsh     ; git show $argv ; end
function gss     ; git stash save $argv ; end
function gst     ; git status $argv ; end
function gunpush ; git push -f origin HEAD^:master $argv ; end # Undo git push
function gx      ; git annex $argv ; end

#============= Replacements and additional options for standard tools
function ack    ; ag $argv ; end # Ack is not installed, but we have ag which is supposed to be a replacement
function ackp   ; ag $argv --page="less -R"; end # Ack with pager if there are many results
function cat    ; bat $argv ; end  # Better cat
function catp   ; bat -p $argv ; end  # Skip line numbers
function catpp  ; bat -pp $argv ; end  # Skip line numbers and pagination
function ccat   ; command cat $argv ; end  # Just in case I need 'cat'
function fda    ; fd -IH $argv ; end # Search in all files
function grep   ; command grep --color=auto $argv ; end  # Not really used, as I switched to rg
function locate ; echo "Use `fd`, `mdfind` or `mdfind -name foo` instead. Use 'command locate' if you really need to run it."; end # Add message when using the 'locate' command to use mdfind instead
function rgp    ; command rg -p $argv | less -RFX ; end # Run ripgrep (better version of ack and ag) output through pager
function rga    ; command rg -uuu $argv ; end # Look everywhere (in the ignored and hidden files)
#------------- Custom tools
function dps ;  docker ps --format 'table {{.Names}}\t{{.Image}}' $argv; end # Nicer docker ps formatting
function lazycolima ; DOCKER_HOST=unix:///Users/switowski/.colima/default/docker.sock command lazydocker $args; end # Make lazydocker work with colima (see https://github.com/jesseduffield/lazydocker/issues/311)
function ncdu  ; command ncdu --confirm-quit $argv ; end  # Don't quit when I press "q" once


#============= Programming language specific
#------------- Python
function ppip ; env PIP_REQUIRE_VIRTUALENV="" pip $argv; end  # Run pip outside of a virtualenv (otherwise pip will refuse to run)
#------------- Rails
function rs ; rails server $argv ; end
function rc ; rails console $argv ; end
function bx ; bundle exec $argv ; end

#============= Sensitive information scripts
# Check ~/.extra.fish file for those

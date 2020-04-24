# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# Utilities
function grep     ; command grep --color=auto $argv ; end

# List directory contents
function ll ; ls -al $argv ; end
function l  ; ls -al $argv ; end
function e  ; exa $argv ; end
function el  ; exa -l $argv ; end

# Important one ! Parenting changing perms on /
# In Mac there is no --preserve-root option
#function chown  ; command chown --preserve-root $argv ; end
#function chmod  ; command chmod --preserve-root $argv ; end
#function chgrp  ; command chgrp --preserve-root $argv ; end

# Shortcuts
function g  ; git $argv ; end
function v  ; vim $argv ; end
function o  ; open $argv ; end
function hm ; history merge ; end
function ta ; tmux attach ; end
function td ; tmux detach ; end
function be ; bundle exec $argv ; end
function dc ; docker-compose $argv ; end
function k ; kubectl $argv ; end
function i ; ipython $argv ; end

# Ack is not installed, but we have ag which is supposed to be a replacement
function ack ; ag $argv ; end
# Ack with pager if there are many results
function ackp ; ag $argv --page="less -R"; end
# Run ripgrep (better version of ack and ag) output through pager
function rgp      ; command rg -p $argv | less -RFX ; end
function rga      ; command rg -uuu $argv ; end  # look everywhere (in the ignored and hidden files)

# Searching for stuff
# Add message when using the 'locate' command to use mdfind instead
function locate ; echo "Use `fd`, `mdfind` or `mdfind -name foo` instead. Use 'command locate' if you really need to run it."; end
function fda    ; fd -IH $argv ; end  # fd in all files

# Git functions
function ga     ; git add $argv ; end
function gb     ; git branch $argv ; end
function gbr    ; git branch $argv ; end
function gci    ; git commit $argv ; end
function gcp    ; git cherry-pick $argv ; end
function gco    ; git checkout $argv ; end
function gca    ; git add -A; and git commit -av $argv; end
function gd     ; git diff $argv ; end
function gds    ; git diff --staged $argv ; end
function gffs   ; git add --all; and git commit --amend --no-edit $argv ; end
function gl     ; git log $argv ; end
function gp     ; git push $argv ; end
function gps    ; git push $argv ; end
function gpl    ; git pull $argv ; end
function gpf    ; git push --force-with-lease $argv ; end
function gpr    ; git pull --rebase $argv ; end
function gs     ; git status $argv ; end
function gsa    ; git stash apply $argv ; end
function gsh    ; git show $argv ; end
function gss    ; git stash save $argv ; end
function gst    ; git status $argv ; end
# Undo git push
function gunpush    ; git push -f origin HEAD^:master $argv ; end

# Python
function gpip ; env PIP_REQUIRE_VIRTUALENV="" pip $argv; end  # Run pip outside of a virtualenv

# Virtualfish fix - this will enable fish when it's run for the first time and unregister the alias
# It's the equivalent of doing the "eval" in config.fish but it doesn't slow you down
# UPDATE: It was used when vf was installed with pyenv. Now that we use pipx, it's not needed
#alias vf="eval (~/.pyenv/shims/python -m virtualfish compat_aliases); and vf" # <- this was use with pyenv
# Same as above but for workon
#function workon; eval (~/.pyenv/shims/python -m virtualfish compat_aliases); and workon $argv; end

# Rails
function rs ; rails server $argv ; end
function rc ; rails console $argv ; end
function bx ; bundle exec $argv ; end

# Elasticsearch functions
function es-delete-indexes ; curl -XDELETE 'http://localhost:9200/_all' $argv ; end
function di ;                curl -XDELETE 'http://localhost:9200/_all' $argv ; end

# Docker stuff
function dps ;  docker ps --format 'table {{.Names}}\t{{.Image}}' $argv; end
#   ---------------------------
#   Mac OS functions
#   ---------------------------
# function cask ; brew cask; end  # I never used it

#  ---------------------------
#  Work related functiones
#  ---------------------------
function deploystackaws ; ssh ubuntu@ec2-18-217-157-146.us-east-2.compute.amazonaws.com $argv ; end
function deploystackgce ; ssh 35.231.149.85 $argv ; end

# CFT stuff
function midbash         ; docker exec -it cft-portal_middleware_1 /bin/bash ; end
function midrestart      ; docker-compose restart middleware ; end
function rpbash          ; docker-compose run --rm reports-pipeline bash ; end

function windowsr       ; rdesktop  -a 16 -u switowsk -d CERN -g 1024x768 cernts.cern.ch $argv ; end
function windowsrbig   ; xfreerdp  -a 16 -u switowsk -d CERN -g 1600x900 cernts.cern.ch $argv ; end

# Project related functiones
function js ; bundle exec jekyll serve --unpublished -w --config _config.yml,_config-dev.yml --livereload $argv ; end
function watchpostimg ; watchexec -w _posts/img npm run gulp post-img $argv ; end

######## Temporary stuff ########


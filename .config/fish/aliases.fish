# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# Utilities
function g        ; git $argv ; end
function grep     ; command grep --color=auto $argv ; end

# List directory contents
alias ll='ls -al'
alias l='ls -al'

# Important one ! Parenting changing perms on /
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Shortcuts
alias g="git"
alias v="vim"
alias o="open"

# Ack is not installed, but we have ag which is supposed to be a replacement
alias ack='ag'

# Git aliases
alias ga="git add"
alias gb="git branch"
alias gbr="git branch"
alias gci="git commit"
alias gcp="git cherry-pick"
# alias gcl="git clone" # I never used it
alias gco="git checkout"
alias gd="git diff"
alias gds="git diff --staged"
# alias gf="git reflog" # I never used it
alias gffs="git add --all; and git commit --amend --no-edit"
alias gl="git log"
# alias glp="git log --pretty=oneline" # I never used it
alias gp="git push"
alias gps="git push"
alias gpl="git pull"
alias gpf="git push --force"
alias gpr="git pull --rebase"
# alias grm="git reset --hard upstream/master" # I never used it
alias gs="git status"
alias gsa="git stash apply"
alias gsh="git show"
alias gss="git stash save"
alias gst="git status"
# Undo git push
alias gunpush="git push -f origin HEAD^:master"

# IPython
alias i='ipython'

# Rails
alias rs="rails server"
alias rc="rails console"
alias bx="bundle exec"

# Miscellaneous
alias gpw="workon gpw and cd ./workspace/gpw and ./gpw.py"

# Elasticsearch aliases
alias es-delete-indexes="curl -XDELETE 'http://localhost:9200/_all'"
alias di="curl -XDELETE 'http://localhost:9200/_all'"

#   ---------------------------
#   Mac OS aliases
#   ---------------------------
alias cask='brew cask'

#   ---------------------------
#   Work related aliases
#   ---------------------------
alias kinit='kinit switowsk@CERN.CH'
alias cds3dbrecreate='yes | cds db destroy; and cds db init; and cds db create; and cds users create test@test.ch -a'
alias cds3indexrecreate="curl -XDELETE 'http://localhost:9200/_all'; and cds index init"
alias cds3locationcreate="cds files location default /eos/workspace/c/cds/avworkflow/sorenson_input --default"
alias cds3fixtures="cds fixtures keywords; and cds fixtures categories; and cds fixtures licenses; and cds index run"

alias cds3celerystart='celery -A cds.celery worker -l info'
alias cds3flowerstart='celery -A cds.celery worker -l info'

# Log in to cds-prod machines
alias 'cds-prod'='osascript ~/Library/Scripts/cds-prod.scpt'

#SSH aliases
alias deploystackaws='ssh ubuntu@ec2-18-217-157-146.us-east-2.compute.amazonaws.com'
alias lx='ssh switowsk@lxplus.cern.ch'
alias aiadm='ssh switowsk@aiadm.cern.ch'
alias cdstest='ssh switowsk@cds-test-wn-02.cern.ch'
alias cdstest1='ssh switowsk@cds-test-wn-01.cern.ch'
alias cdstest2='ssh switowsk@cds-test-wn-02.cern.ch'
alias loadbalancer='ssh switowsk@cds-lb-01.cern.ch'
alias prod='ssh switowsk@cds-wn-01.cern.ch'
alias prod1='ssh switowsk@cds-wn-01.cern.ch'
alias prod2='ssh switowsk@cds-wn-02.cern.ch'
alias prod3='ssh switowsk@cds-wn-03.cern.ch'
alias prod4='ssh switowsk@cds-wn-04.cern.ch'
alias prod5='ssh switowsk@cds-wn-05.cern.ch'
alias sshprod='osascript ~/Library/Scripts/cds-prod.scpt'
alias dbmaster='ssh switowsk@cds-dbmaster-01.cern.ch'
alias builder='ssh switowsk@cds-builder-test-01.cern.ch'
# CDSLABS-QA aliases
alias tmq='ssh switowsk@cdslabs-mq.cern.ch'
alias ttask1='ssh switowsk@cdslabs-qa-task1.cern.ch'
alias ttask2='ssh switowsk@cdslabs-qa-task2.cern.ch'
alias ttask3='ssh switowsk@cdslabs-qa-task3.cern.ch'
alias tbuilder='ssh switowsk@cdslabs-qa-builder1.cern.ch'
alias tlb1='ssh switowsk@cdslabs-qa-lb1.cern.ch'
alias tlb2='ssh switowsk@cdslabs-qa-lb2.cern.ch'
alias tweb1='ssh switowsk@cdslabs-qa-web1.cern.ch'
alias tweb2='ssh switowsk@cdslabs-qa-web2.cern.ch'
alias tweb3='ssh switowsk@cdslabs-qa-web3.cern.ch'
alias tweb4='ssh switowsk@cdslabs-qa-web4.cern.ch'
# cds-videos aliases
alias mq='ssh switowsk@videos-cds-mq.cern.ch'
alias task1='ssh switowsk@videos-cds-task1.cern.ch'
alias task2='ssh switowsk@videos-cds-task2.cern.ch'
alias task3='ssh switowsk@videos-cds-task3.cern.ch'
alias builder='ssh switowsk@videos-cds-builder1.cern.ch'
alias web1='ssh switowsk@videos-cds-web1.cern.ch'
alias web2='ssh switowsk@videos-cds-web2.cern.ch'
alias web3='ssh switowsk@videos-cds-web3.cern.ch'
alias web4='ssh switowsk@videos-cds-web4.cern.ch'
alias mq='ssh switowsk@videos-cds-mq.cern.ch'
alias lb1='ssh switowsk@videos-cds-lb1.cern.ch'
alias lb2='ssh switowsk@videos-cds-lb2.cern.ch'

#Windows terminal
alias windowsr='rdesktop  -a 16 -u switowsk -d CERN -g 1024x768 cernts.cern.ch'
alias windowsrf='xfreerdp  -a 16 -u switowsk -d CERN -g 1024x768 cernts.cern.ch'
alias windowsrbig='rdesktop  -a 16 -u switowsk -d CERN -g 1600x900 cernts.cern.ch'
alias windowsrbigf='xfreerdp  -a 16 -u switowsk -d CERN -g 1600x900 cernts.cern.ch'

#Sync aliases
alias syncfromlocal='rsync -avz /home/switowsk/src/cds-invenio-cern/ switowsk@lxplus.cern.ch:/afs/cern.ch/user/s/switowsk/private/cds-invenio-cern/'
alias syncfromremote='rsync -avz switowsk@lxplus.cern.ch:/afs/cern.ch/user/s/switowsk/private/cds-invenio-cern/ /home/switowsk/src/cds-invenio-cern/'

#virtualenv aliases
alias master='workon master'

# Temporary alias for DFS
alias mount_dfs='sudo mount -t cifs //cerndfs.cern.ch/dfs/Services/E-Publishing/Digitization/ /dfs/cern.ch/ -o user=switowsk,iocharset=utf8,file_mode=0777,dir_mode=0777'

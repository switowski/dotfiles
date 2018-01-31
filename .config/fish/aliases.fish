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

# Important one ! Parenting changing perms on /
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Shortcuts
alias g="git"
alias v="vim"

# Ack is not installed, but we have ag which is supposed to be a replacement
alias ack='ag'

# Git aliases
alias ga="git add"
alias gb="git branch"
alias gbr="git branch"
alias gci="git commit"
# alias gcl="git clone" # I never used it
alias gco="git checkout"
alias gd="git diff"
alias gds="git diff --staged"
# alias gf="git reflog" # I never used it
alias gffs="git add --all and git commit --amend --no-edit"
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
alias cds3dbrecreate='yes | cds db destroy; and cds db init; and cds db create; and cds users create test@test.ch -a'
alias cds3indexrecreate="curl -XDELETE 'http://localhost:9200/_all'; and cds index init"
alias cds3locationcreate="cds files location default /eos/workspace/c/cds/avworkflow/sorenson_input --default"
alias cds3fixtures="cds fixtures keywords; and cds fixtures categories; and cds fixtures licenses; and cds index run"

alias cds3celerystart='celery -A cds.celery worker -l info'
alias cds3flowerstart='celery -A cds.celery worker -l info'

#SSH aliases
alias deploystackaws='ssh -i "/home/switowsk/.ssh/private/DeployStackProd.pem" ubuntu@ec2-18-217-157-146.us-east-2.compute.amazonaws.com'
alias lx='ssh switowsk@lxplus.cern.ch'
alias aiadm='ssh switowsk@aiadm.cern.ch'
alias cdstest='ssh cds-test-wn-02'
alias cdstest1='ssh cds-test-wn-01'
alias cdstest2='ssh cds-test-wn-02'
alias loadbalancer='ssh cds-lb-01'
alias prod='ssh cds-wn-01'
alias prod1='ssh cds-wn-01'
alias prod2='ssh cds-wn-02'
alias prod3='ssh cds-wn-03'
alias prod4='ssh cds-wn-04'
alias prod5='ssh cds-wn-05'
alias dbmaster='ssh cds-dbmaster-01'
alias builder='ssh root@cds-builder-test-01.cern.ch'
# CDSLABS-QA aliases
alias ttask1='ssh root@cdslabs-qa-task1.cern.ch'
alias ttask2='ssh root@cdslabs-qa-task2.cern.ch'
alias ttask3='ssh root@cdslabs-qa-task3.cern.ch'
alias tbuilder='ssh root@cdslabs-qa-builder1.cern.ch'
alias tlb1='ssh root@cdslabs-qa-lb1.cern.ch'
alias tlb2='ssh root@cdslabs-qa-lb2.cern.ch'
alias tweb1='ssh root@cdslabs-qa-web1.cern.ch'
alias tweb2='ssh root@cdslabs-qa-web2.cern.ch'
alias tweb3='ssh root@cdslabs-qa-web3.cern.ch'
alias tweb4='ssh root@cdslabs-qa-web4.cern.ch'
# cds-videos aliases
alias mq='ssh root@videos-cds-mq.cern.ch'
alias task1='ssh root@videos-cds-task1.cern.ch'
alias task2='ssh root@videos-cds-task2.cern.ch'
alias task3='ssh root@videos-cds-task3.cern.ch'
alias builder='ssh root@videos-cds-builder1.cern.ch'
alias web1='ssh root@videos-cds-web1.cern.ch'
alias web2='ssh root@videos-cds-web2.cern.ch'
alias web3='ssh root@videos-cds-web3.cern.ch'
alias web4='ssh root@videos-cds-web4.cern.ch'
alias mq='ssh root@videos-cds-mq.cern.ch'
alias lb1='ssh root@videos-cds-lb1.cern.ch'
alias lb2='ssh root@videos-cds-lb2.cern.ch'

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

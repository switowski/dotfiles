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

function sudo!!
  eval sudo $history[1]
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


########################### Temporary stuff for CERN #########################
function mount_dfs --description "Mounts CERN dfs"
  sudo mount -t cifs //cerndfs.cern.ch/dfs/Services/E-Publishing/Digitization/ /dfs/cern.ch/ -o user=switowsk,iocharset=utf8,file_mode=0777,dir_mode=0777
end

function cds3install --description "Installs CDS Labs in the current folder"
  set cur_dir $PWD
  pip install -r requirements.developer.txt
  pip install -e .[all]

  python -O -m compileall .
  # Make sure you ran ./scripts/setup-npm.sh the first time you run this!
  ./scripts/setup-assets.sh

  cdvirtualenv var/instance
  # Set some settings in case we forget to export them in env
  echo "SQLALCHEMY_DATABASE_URI='postgresql+psycopg2://cds:cds@localhost/cds'" > cds.cfg
  cd "$cur_dir"

  echo 'Remember to run $ ./scripts/setup-instance.sh to setup the DB, create user and load fixtures!'
  echo 'You can now start the server with $ cds run --debugger --with-threads'
end

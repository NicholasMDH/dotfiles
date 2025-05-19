# quit if not in interactive mode
# equivalent to `test -z "$PS1"`
[ -z "$PS1" ] && return

# start ssh-agent if it's not running already and import private key

# check if any keys are loaded to ssh-agent
ssh-add -l &> /dev/null
if [ $? == 2 ]; then # ssh-add could not establish a connection to ssh-agent

  # run ssh-agent with load stored agent connection info
  [ -r ~/.ssh-agent ] && eval "$(<~/.ssh-agent)" > /dev/null

  # check keys again
  ssh-add -l &>/dev/null
  if [ $? == 2 ]; then # stored agent connection didn't work
    (umask 066; ssh-agent > ~/.ssh-agent) # start agent and store connection info
    eval "$(<~/.ssh-agent)" > /dev/null
  fi
fi

# check keys again...
ssh-add -l &> /dev/null
if [ "$?" == 1 ]; then # no keys in agent
  ssh-add -t 4h # add key with 4 hour timeout
fi

echo "there should be an ssh-agent chillin"

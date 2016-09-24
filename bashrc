# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export BROWSER=chromium

if [[ $(whoami) == "dmitry" ]]; then
    export PATH="/home/${USER}/Dotfiles/scripts:$PATH"
    export PATH="/home/${USER}/bin:$PATH"
fi

# Modified commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias du='du --max-depth 1'

# Shortcuts
alias fnd='find . -iname'
alias ..='cd ..'

# Set red prompt if root, green otherwise
if [[ $(uname -n) == "Ubuntu" || $(uname -n) == "hive" ]]; then
    host='\[\e[32m\]\h\[\e[32m\]'
else
    host='\[\e[33m\]\h\[\e[0m\]'
fi
if [ $UID -eq 0 ]; then
    user="\[\e[1;31m\]\u\[\e[0m\]"
else
    user="\[\e[1;32m\]\u\[\e[0m\]"
fi
PS1="${user}@${host}\[\e[0m\]:\[\e[1;34m\]\W\[\e[0m\]\\$ "

# Save history immediately
shopt -s histappend
if [ "${PROMPT_COMMAND}" ]; then
    PROMPT_COMMAND="$PROMPT_COMMAND;history -a"
else
    PROMPT_COMMAND="history -a"
fi
export HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Correct cd paths automatically
shopt -s cdspell

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.lns" # Add sym links to software
export PATH="$PATH:/media/dmitry/sadness/Learning/course_work/openbr/build/app/br" # Add openbr
export UNIVERSITY_PATH="/media/dmitry/sadness/Programming/University"
export SADNESS_PATH="/media/dmitry/sadness"

# added by Anaconda3 2.2.0 installer
export PATH="/home/dmitry/Software/anaconda3/bin:$PATH"

# java stuff
export CLASSPATH=/opt/apache-tomcat-7.0.62/lib/servlet-api.jar:$CLASSPATH

# django stuff
export PYTHONPATH=/usr/local/lib/python3.4/dist-packages

export QMAKESPEC="/usr/local/qt/mkspecs/linux-g++"
export PATH="$PATH:/local/qmake/bin"

# android studio
export PATH="$PATH:$HOME/Software/android-studio/bin/"

# hadoop
export JAVA_HOME=/usr/local/java/jdk1.8.0_77
export PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
export HADOOP_HOME=/usr/local/hadoop
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib"
export PATH=$PATH:/usr/local/hadoop/bin/
export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop

#oracle
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export ORACLE_BASE=/u01/app/oracle
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export PATH=$ORACLE_HOME/bin:$PATH

# pig
export PIG_HOME=/usr/lib/pig/pig-0.11.1
export PATH=$PATH:$PIG_HOME/bin

# sonar
export PATH=$PATH:$SADNESS_PATH/Software/sonar-scanner-2.6.1/bin

[ -s "/home/dmitry/.jabba/jabba.sh" ] && source "/home/dmitry/.jabba/jabba.sh"

PATH="/home/dmitry/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/dmitry/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/dmitry/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/dmitry/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/dmitry/perl5"; export PERL_MM_OPT;

# PS1 special characters
UserName="\u"              # the username of the current user
HostShort="\h"             # the hostname up to the first `.'
WorkingDirectory="\w"      # the current working directory

HostFull="\H"              # the hostname
JobCount="\j"              # the  number of jobs currently managed by the shell
DeviceName="\l"            # the basename of the shell's terminal  device name
NewLine="\n"               # newline
Return="\r"                # carriage return
ShellName="\s"             # the  name  of  the shell, the basename of $0 (the portion following the final slash)
Date="\d"                  # the date  in  "Weekday  Month  Date"  format (e.g., "Tue May 26")
Time24Hour="\t"            # the current time in 24-hour HH:MM:SS format
Time12Hour="\T"            # the current time in 12-hour HH:MM:SS format
TimeAmPm="\@"              # the current time in 12-hour am/pm format
WorkingDirectoryBase="\W"  # the  basename  of the current working direc­tory

EscASCII="\e"              # an ASCII escape character (033)
EscBegin="\["              # begin a sequence of non-printing characters, which could be used to embed a terminal con­trol sequence into the prompt
EscEnd="\]"                # end a sequence of non-printing characters
EscNewline="\012"          # new line with ASCII chars

# Colors with escapes
Reset="${EscBegin}${EscASCII}[0m${EscEnd}"
Black="${EscBegin}${EscASCII}[0;30m${EscEnd}"
Red="${EscBegin}${EscASCII}[0;31m${EscEnd}"
Green="${EscBegin}${EscASCII}[0;32m${EscEnd}"
Yellow="${EscBegin}${EscASCII}[0;33m${EscEnd}"
Blue="${EscBegin}${EscASCII}[0;34m${EscEnd}"
Purple="${EscBegin}${EscASCII}[0;35m${EscEnd}"
Cyan="${EscBegin}${EscASCII}[0;36m${EscEnd}"
White="${EscBegin}${EscASCII}[0;37m${EscEnd}"

export PS1="\
${Green}${UserName}@${HostShort} \
${Yellow}${WorkingDirectory}\
${Cyan}\$(__git_ps1) \
${Reset}${EscNewline}$ "

# set aliases
alias cls="tput reset"
alias zip="tar.exe"
alias ridk="ridk.cmd"
alias sam="sam.cmd"
alias pbcopy="clip"
alias redis-cli="rdcli"
alias lua="lua54"
alias open="start"

PROMPT_COMMAND='history -a'

HISTSIZE=20000
HISTFILESIZE=20000

function winget { cmd.exe /c "winget $1 $2 $3";}

function mklink { cmd.exe /c "mklink $1 $2 $3";}

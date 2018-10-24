#!/bin/bash

# This script provides a workaround to some of the buggy and/or unpredictable
# behaviour relating to savegames in XCOM 2. See the README file for usage
# details.

SVDIR="$HOME/.local/share/feral-interactive/XCOM 2 WotC/VFS/Local/my games/"\
"XCOM2 War of the Chosen/XComGame/SaveData"

usage="Usage: $0 [-c DELAY] [-d] [-l[t]] [-s SAVEGAMEDIR] BACKUPDIR"

while getopts "c:dls:t" opt; do
    case ${opt} in
        c ) cflag=1; SLEEP=$OPTARG ;;
        d ) dflag=1 ;;
        l ) lflag=1 ;;
        s ) SVDIR="${OPTARG%/}" ;;
        t ) tflag=1 ;;
        \? ) echo $usage 1>&2
             exit 1 ;;
    esac
done
shift $((OPTIND - 1))

if [ -z "$1" ]
then
    echo $usage
    exit 1
fi

BACKUPDIR="${1%/}"

mkdir -p $1

while : ; do
    echo -n $(date +"[%Y-%m-%d %T]"): "syncing... "
    rsync -tr "$SVDIR"/save_Save* "$SVDIR"/profile.bin "$BACKUPDIR"/.
    echo done!
    [[ $dflag ]] && diff -r "$SVDIR" "$BACKUPDIR" | tr -d '/' |
            (echo "Files only in savegame folder ('<') / backup folder ('>'):";
             sed -E 's/Only in '"${SVDIR//\/}"': (.*)$/< \1/g;
                     s/Only in '"${BACKUPDIR//\/}"': (.*)$/> \1/g;
                     s/save_//g')
    [[ $cflag ]] || break
    sleep $SLEEP
done

if [ $lflag ]
then
    if [ $tflag ]
    then
        (echo "Save files sorted by timestamp (press 'q' to quit):";
         ls -lt --time-style=+"[%Y-%m-%d %T]" "$SVDIR" |
             sed -E '1d; s/^.*(\[.*)$/\1/g; s/save_//g') | less
        exit 0
    fi
    (echo "Save files sorted by name (press 'q' to quit):";
     ls -1 "$SVDIR" | sort -nr -k 2) | less
    exit 0
fi

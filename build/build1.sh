#!/usr/bin/env bash

set -u

# Define directories.
echo "\$BASH_SOURCE is ${BASH_SOURCE}"
echo "\$0 is $0"

# Get build script dir
SCRIPT_DIR=$(pwd)/$(dirname $0)
echo "SCRIPT_DIR is $SCRIPT_DIR"

# Get build script dir2
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" & pwd)
echo "SCRIPT_DIR is $SCRIPT_DIR"

TOOLS_DIR=$SCRIPT_DIR/tools
echo "TOOLs_DIR is $TOOLS_DIR"

# Other thing
NUGET_EXE=$TOOLS_DIR/nuget.exe
NUGET_URL=https://dist.nuget.org/win-x86-commandline/v4.3.0/nuget.exe
FAKE=$TOOLS_DIR/fake

# Get variable form enviroment
A=${USER1:-"Hello"}
echo $A

# Define default arguments
TARGET="Default"
CONFIGURATION="Release"
VERBOSITY="verbose"
DRYRUN=
SCRIPT_ARGUMENTS=()

# Parse arguments
for i in "$@"
do 
    case $1 in
        -t|--target) TARGET="$2"; shift ;;
        -c|--configuration) CONFIGURATION="$2"; shift ;;
        -v|--verbosity) VERBOSITY="$2"; shift ;;
        -d|--dryrun) DRYRUN="-dryrun" ;;
        --) shift; SCRIPT_ARGUMENTS+=("$@"); break ;;
        *) SCRIPT_ARGUMENTS+=("$1") ;;
    esac
    shift
done
echo "TARGET is $TARGET"
echo "CONFIGURATION is $CONFIGURATION"
echo "VERBOSITY is $VERBOSITY"
echo "DRYRUN is $DRYRUN"
echo "SCRIPT_ARGUMENTS is ${SCRIPT_ARGUMENTS[*]}"

# Make sure the tools folder exist
if [ ! -d "$TOOLS_DIR" ]
then
    mkdir "$TOOLS_DIR"
fi

check_dotnet_instal() {
    type dotnet >/dev/null 2>&1
    if [ "$?" -ne 0 ]
    then 
        echo >&2 "Didn't find dotnet.  Aborting."
        exit 1
    fi
    # type dotnet >/dev/null 2>&1 || { echo >&2 "Didn't find dotnet.  Aborting."; exit 1; }
    # if ! command; then echo "command failed"; exit 1; fi
}

check_dotnet_instal

# Download Nuget
check_nuget() {
    if [ ! -f "$NUGET_EXE" ]
    then
        echo "Downloading Nuget..."
        curl -Lsfo "$NUGET_EXE" $NUGET_URL
        if [ $? -ne 0 ]
        then 
            echo "An error occured while downloading nuget.exe"
            exit 1
        fi 
    fi
}
check_nuget

# Install Fake
if [ ! -f "$FAKE" ]
then 
    dotnet tool install fake-cli --tool-path $TOOLS_DIR
fi

# Run Fake
echo "SCRIPT_ARGUMENTS ${SCRIPT_ARGUMENTS[@]}"
exec "$FAKE" run build.fsx 






#!/bin/bash


##########################################
# INFO
##########################################
: <<'END'

# Known flags
# Updated 20160225 - ProfessorKaos64
BUILD_GAMEPAK='1'
JOBS='1'
NO_GCH='0'
DEDICATED='0'
SILENT='0'
GL_HARDLINK='0'
ID_MCHECK='2'
BUILD_ROOT='build'
ALSA='1'
CC='gcc'
TARGET_CORE='1'
BUILD='release'
TARGET_GAME='1'
TARGET_MONO='0'
BASEFLAGS=''
CXX='g++'
NOCURL='0'
DEBUG_MEMORY='0'
IDNET_HOST=''
LIBC_MALLOC='1'
ID_NOLANADDRESS='0'
TARGET_DEMO='0'
Command line: BUILD_GAMEPAK='1'
Command line: NO_GCH='0'
Command line: BUILD='release'
END

##########################################

mkdir -p ~/games/tdm/darkmod

# make sure this file exists
touch scons.signatures.dblite

# FAST=true
# --debug=explain

# $@ = pass along the flags like "BUILD=profile" or "BUILD=debug"
time scons -j2 BUILD_GAMEPAK=1 NO_GCH=0 BUILD=release --debug=explain "$@"
mv gamex86-base.so gamex86.so
#strip gamex86.so
#strip thedarkmod.x86

cp thedarkmod.x86 ~/games/tdm/darkmod/
cp thedarkmod.x86 ~/games/tdm/

cp tdm_game02.pk4 ~/games/tdm/darkmod/tdm_game02.pk4
if [ -f ~/games/tdm/darkmod/gamex86.so ]; then
  rm ~/games/tdm/darkmod/gamex86.so
fi


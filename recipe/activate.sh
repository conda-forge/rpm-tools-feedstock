#!/bin/sh

# Preserve any user/system value so deactivate can restore it.
if [ -n "${RPM_CONFIGDIR+x}" ]; then
    export CONDA_BACKUP_RPM_TOOLS_RPM_CONFIGDIR="${RPM_CONFIGDIR}"
else
    unset CONDA_BACKUP_RPM_TOOLS_RPM_CONFIGDIR
fi

export RPM_CONFIGDIR="${CONDA_PREFIX}/lib/rpm"

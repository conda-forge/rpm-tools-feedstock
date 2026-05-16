#!/bin/sh

# Restore previous value if one existed before activation.
if [ -n "${CONDA_BACKUP_RPM_TOOLS_RPM_CONFIGDIR+x}" ]; then
    export RPM_CONFIGDIR="${CONDA_BACKUP_RPM_TOOLS_RPM_CONFIGDIR}"
    unset CONDA_BACKUP_RPM_TOOLS_RPM_CONFIGDIR
else
    unset RPM_CONFIGDIR
fi

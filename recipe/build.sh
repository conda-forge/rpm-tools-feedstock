#!/usr/bin/env bash

declare -a CONFIGURE_ARGS
if "${PYTHON}" --version | grep -i pypy; then
    CONFIGURE_ARGS+=("PYTHON_CFLAGS=-I$CONDA_PREFIX/include")
    CONFIGURE_ARGS+=("PYTHON_LIBS=-L$PREFIX/lib -lpypy3-c")
fi

# --with-cap \

./configure \
    --prefix="${PREFIX}"  \
    --enable-python \
    --with-external-db \
    --with-lua \
    PYTHON="${PYTHON}" \
    "${CONFIGURE_ARGS[@]}"

make "-j${CPU_COUNT}" install
make check
make installcheck

"${PYTHON}" -m pip install ./python -vv

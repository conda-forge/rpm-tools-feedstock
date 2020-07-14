#!/usr/bin/env bash

declare -a CONFIGURE_ARGS
if [[ ${target_platform} == "osx-64" ]]; then
  # CONFIGURE_ARGS+=("--disable-dependency-tracking")
  # CONFIGURE_ARGS+=("--disable-silent-rules")
  # CONFIGURE_ARGS+=("--enable-nls")
  # CONFIGURE_ARGS+=("--disable-plugins")
  :
else
  CONFIGURE_ARGS+=("--with-cap")
  CONFIGURE_ARGS+=("--enable-python")
  CONFIGURE_ARGS+=("PYTHON=${PYTHON}")
  if "${PYTHON}" --version | grep -i pypy; then
      CONFIGURE_ARGS+=("PYTHON_CFLAGS=-I$CONDA_PREFIX/include")
      CONFIGURE_ARGS+=("PYTHON_LIBS=-L$PREFIX/lib -lpypy3-c")
  fi
fi

./configure \
    --prefix="${PREFIX}"  \
    --with-external-db \
    --with-lua \
    --without-apidocs
    "${CONFIGURE_ARGS[@]}"

make "-j${CPU_COUNT}" install
make check
make installcheck

if [[ ${target_platform} != "osx-64" ]]; then
  "${PYTHON}" -m pip install ./python -vv
fi

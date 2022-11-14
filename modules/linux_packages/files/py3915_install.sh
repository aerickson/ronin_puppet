#!/usr/bin/env bash

set -e
# set -x

apt remove libpython3.9-minimal libpython3.9-stdlib -y

# created with https://github.com/starkandwayne/install-debs-in-order
dpkg -i libpython3.9-minimal_3.9.15-1+bionic1_amd64.deb
dpkg -i python3.9-lib2to3_3.9.15-1+bionic1_all.deb
dpkg -i libpython3.9-stdlib_3.9.15-1+bionic1_amd64.deb
dpkg -i python3.9-distutils_3.9.15-1+bionic1_all.deb
dpkg -i python3.9-minimal_3.9.15-1+bionic1_amd64.deb
dpkg -i libpython3.9_3.9.15-1+bionic1_amd64.deb
dpkg -i python3.9_3.9.15-1+bionic1_amd64.deb
dpkg -i libpython3.9-dev_3.9.15-1+bionic1_amd64.deb
dpkg -i python3.9-venv_3.9.15-1+bionic1_amd64.deb
dpkg -i python3.9-dev_3.9.15-1+bionic1_amd64.deb

apt install --fix-broken -y

#!/usr/bin/env sh

yum update -y

/opt/python/cp27-cp27mu/bin/python -m pip install cython
/opt/python/cp35-cp35m/bin/python -m pip install cython
/opt/python/cp34-cp34m/bin/python -m pip install cython

yum install cmake gsl-devel -y

wget http://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.gz
#wget http://www.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.14/bin/linux-centos5-x86_64-gcc482/hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared.tar.gz
curl -L http://www.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.14/bin/linux-centos5-x86_64-gcc482/hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared.tar.gz -o hoge.tar.gz

tar xf hoge.tar.gz
tar xf boost_1_59_0.tar.gz

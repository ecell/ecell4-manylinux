#!/usr/bin/env sh

git clone git://github.com/ecell/ecell4
cd ecell4

BOOST_INCLUDEDIR=/root/boost_1_59_0 cmake . -DPYTHON_EXECUTABLE:FILEPATH=/opt/python/cp27-cp27mu/bin/python && make
BOOST_INCLUDEDIR=/root/boost_1_59_0 cmake . -DPYTHON_EXECUTABLE:FILEPATH=/opt/python/cp34-cp34m/bin/python && make
BOOST_INCLUDEDIR=/root/boost_1_59_0 cmake . -DPYTHON_EXECUTABLE:FILEPATH=/opt/python/cp35-cp35m/bin/python && make

cp /root/hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared/lib/libhdf5.so.9 /lib64/
cp /root/hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared/lib/libhdf5_cpp.so.9 /lib64/
cp /root/hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared/lib/libsz.so.2 /lib64/

auditwheel repair /root/ecell4/python/dist/ecell-4.0.4-cp35-cp35m-linux_x86_64.whl
auditwheel repair /root/ecell4/python/dist/ecell-4.0.4-cp34-cp34m-linux_x86_64.whl
auditwheel repair /root/ecell4/python/dist/ecell-4.0.4-cp27-cp27mu-linux_x86_64.whl

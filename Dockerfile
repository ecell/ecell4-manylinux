FROM quay.io/pypa/manylinux1_x86_64

RUN cd; yum update -y; git clone git://github.com/ecell/ecell4
# Cython
RUN /opt/python/cp35-cp35m/bin/python -m pip install cython
RUN /opt/python/cp34-cp34m/bin/python -m pip install cython

# config.h and BesselTables
RUN cd; yum install cmake gsl-devel -y; wget http://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.gz https://www.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.14/bin/linux-centos5-x86_64-gcc482/hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared.tar.gz; tar xf hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared.tar.gz; tar xf boost_1_59_0.tar.gz
RUN cd /root/ecell4; BOOST_INCLUDEDIR=/root/boost_1_59_0 cmake .; CPATH=/root/boost_1_59_0 make BesselTables

# E-Cell4 wheels
RUN LIBRARY_PATH=/root/hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared/lib CPATH=/root/boost_1_59_0:/root/hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared/include /opt/python/cp35-cp35m/bin/python /root/ecell4/python/setup.py bdist_wheel
RUN LIBRARY_PATH=/root/hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared/lib CPATH=/root/boost_1_59_0:/root/hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared/include /opt/python/cp34-cp34m/bin/python /root/ecell4/python/setup.py bdist_wheel

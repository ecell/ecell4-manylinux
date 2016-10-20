FROM quay.io/pypa/manylinux1_x86_64

ARG PYVERSION

WORKDIR /root

RUN yum update -y && yum install -y cmake gsl-devel curl

RUN /opt/python/${PYVERSION}/bin/python -m pip install cython

RUN curl -L http://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.gz -o boost_1_59_0.tar.gz
RUN tar xf boost_1_59_0.tar.gz
ENV BOOST_INCLUDEDIR /root/boost_1_59_0

RUN curl -L https://www.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.14/bin/linux-centos5-x86_64-gcc482/hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared.tar.gz -o hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared.tar.gz
RUN tar xf hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared.tar.gz
RUN cp /root/hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared/lib/libhdf5.so.9 /lib64/
RUN cp /root/hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared/lib/libhdf5_cpp.so.9 /lib64/
RUN cp /root/hdf5-1.8.14-linux-centos5-x86_64-gcc482-shared/lib/libsz.so.2 /lib64/

RUN git clone git://github.com/ecell/ecell4
WORKDIR /root/ecell4

RUN cmake -DPYTHON_EXECUTABLE:FILEPATH=/opt/python/${PYVERSION}/bin/python . && make && make install
RUN auditwheel repair /root/ecell4/python/dist/ecell-*-${PYVERSION}-linux_x86_64.whl

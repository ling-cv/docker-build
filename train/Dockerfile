FROM lingcv/work:base

MAINTAINER yanzhenlei@ling.ai

# install caffe
RUN apt-get update && apt-get install -y --no-install-recommends \
    libatlas-base-dev \
    libboost-all-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    libhdf5-serial-dev \
    libleveldb-dev \
    liblmdb-dev \
    libopencv-dev \
    libprotobuf-dev \
    libsnappy-dev \
    protobuf-compiler \
    python-setuptools \
    && rm -rf /var/lib/apt/lists/*

ENV CAFFE_ROOT /opt/caffe

ENV CLONE_TAG 1.0

RUN git clone -b ${CLONE_TAG} --depth 1 https://github.com/BVLC/caffe.git . && \
    pip install --upgrade pip && \
    cd python && for req in $(cat requirements.txt) pydot; do pip install $req; done && cd .. && \
    mkdir build && cd build && \
    cmake -DCPU_ONLY=1 .. && \
    make -j"$(nproc)"

ENV PYCAFFE_ROOT $CAFFE_ROOT/python
ENV PYTHONPATH $PYCAFFE_ROOT:$PYTHONPATH
ENV PATH $CAFFE_ROOT/build/tools:$PYCAFFE_ROOT:$PATH
RUN echo "$CAFFE_ROOT/build/lib" >> /etc/ld.so.conf.d/caffe.conf && ldconfig

# install tensorflow
RUN apt-get update && apt-get install -y --no-install-recommends \
    libfreetype6-dev \
    libpng12-dev \
    libzmq3-dev \
    pkg-config \
    rsync \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install pip 
RUN pip --no-cache-dir install \
    Pillow \
    h5py \
    ipykernel \
    jupyter \
    matplotlib \
    numpy \
    pandas \
    scipy \
    sklearn \
    && \
    python -m ipykernel.kernelspec

RUN pip --no-cache-dir install \
    http://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.0.0-cp27-none-linux_x86_64.whl

# ProTECT base Dockerfile for somatic sniper
#
# 
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/somaticsniper:1.0.4 - < Dockerfile

# Use pimmuno 
FROM aarjunrao/pimmuno

# get additional dependencies
RUN apt-get update \
    && apt-get install -y cmake \
                          zlib1g-dev

# Install MuSE
RUN git clone https://github.com/genome/somatic-sniper.git \
    && cd somatic-sniper \
    && git checkout -b tags/v1.0.4.0 \
    && mkdir build \
    && cd build \
    && cmake /home/somatic-sniper \
    && make deps \
    && make -j \
    && make install

# get wrapper_scripts
RUN git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/somaticsniper_wrapper.sh"]


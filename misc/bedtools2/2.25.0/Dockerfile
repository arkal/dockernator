# ProTECT Dockerfile for bedtools2
#
# 
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/bedtools2:2.25.0 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/bedtools2 <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

# Get bedtools2
RUN git clone https://github.com/arq5x/bedtools2.git \
    && cd bedtools2 \
    && git checkout v2.25.0 \
    && make \
    && cp bin/* /usr/local/bin

# get wrapper_scripts
RUN git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["bash", "/home/toil_docker_wrappers/bedtools2_wrapper.sh"]
CMD ["-h"]

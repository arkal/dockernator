# ProTECT Dockerfile for  bamutil v1.0.14
#
# 
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/bamutil:4999e120f4b8ceb5c0526d57234d3593f287daf3 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/bamutil <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

# Install MuTect
RUN git clone https://github.com/statgen/bamUtil.git \
    && cd bamUtil/ \
    && git checkout 4999e120f4b8ceb5c0526d57234d3593f287daf3
RUN cd bamUtil/ \
    && make cloneLib \
    && make \
    && make install

# get wrapper_scripts
WORKDIR /home
RUN  git clone https://github.com/arkal/toil_docker_wrappers.git 
WORKDIR /data 
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/bamutil_wrapper.sh"]
CMD ["-h"]

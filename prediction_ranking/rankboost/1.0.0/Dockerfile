# ProTECT Dockerfile for rankboost
#
# 
# Build with: sudo docker build --force-rm=true --no-cache -t aarjunrao/rankboost:1.0.0 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/rankboost <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

# Get the essentials
RUN apt-get install -y r-base

# Get rankboost from github
RUN git clone https://github.com/arkal/rankboost.git \
    && cd rankboost \
    && git checkout releases/1.0.0

# get wrapper_scripts
RUN  git clone https://github.com/arkal/toil_docker_wrappers.git 
WORKDIR /data 
ENTRYPOINT ["bash", "/home/toil_docker_wrappers/rankboost_wrapper.sh"]
CMD ["-h"]

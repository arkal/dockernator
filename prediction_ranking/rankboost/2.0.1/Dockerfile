# ProTECT Dockerfile for rankboost
#
# 
# Build with: sudo docker build --force-rm=true --no-cache -t aarjunrao/rankboost:2.0.1 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/rankboost <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

# Get the essentials
RUN apt-get install -y python-pip
RUN pip install pandas PyYAML

# Get rankboost from github
RUN git clone https://github.com/arkal/rankboost.git \
    && cd rankboost \
    && git checkout releases/2.0.1

# get wrapper_scripts
RUN  git clone https://github.com/arkal/toil_docker_wrappers.git 
WORKDIR /data 
ENTRYPOINT ["bash", "/home/toil_docker_wrappers/rankboost2_wrapper.sh"]
CMD ["-h"]

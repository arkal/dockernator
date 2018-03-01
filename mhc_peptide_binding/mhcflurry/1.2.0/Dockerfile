# ProTECT Dockerfile for MHCflurry
#
# 
# Build with: sudo docker build --force-rm=true --no-cache -t aarjunrao/mhcflurry:1.2.0 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/mhcflurry:1.2.0 <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

RUN apt-get install -y python-pip && \
    pip install -U pip

# Get tensorflow
RUN pip2.7 install tensorflow==1.5.0

# Get mhcflurry
RUN pip2.7 install mhcflurry==1.2.0 && \
    mhcflurry-downloads fetch && \
    mhcflurry-downloads fetch models_class1

# get wrapper_scripts
RUN git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/mhcflurry_wrapper.sh"]
CMD ["--help"]

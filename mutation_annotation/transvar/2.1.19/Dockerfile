# ProTECT Dockerfile for TransVar
#
# 
# Build with: sudo docker build --force-rm=true --no-cache -t aarjunrao/transvar:2.1.19 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/transvar <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

# Get TransVar
RUN curl -L https://bitbucket.org/wanding/transvar/get/v2.1.19.20160221.zip > v2.1.19.20160221.zip 
RUN unzip v2.1.19.20160221.zip  && rm v2.1.19.20160221.zip
RUN cd wanding-transvar-5dd8a7366999 && python setup.py install

# get wrapper_scripts
RUN git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/transvar_wrapper.sh"]
CMD ["-h"]

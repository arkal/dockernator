# ProTECT Dockerfile for  MuTect 1.1.4
#
# 
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/mutect:1.1.4 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/mutect:1.1.4 <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

# Install MuTect
RUN mkdir -p /opt/pimmuno/mutect
WORKDIR /opt/pimmuno/mutect
RUN wget -c http://www.broadinstitute.org/cancer/cga/sites/default/files/data/tools/mutect/muTect-1.1.4-bin.zip
RUN unzip muTect-1.1.4-bin.zip && rm muTect-1.1.4-bin.zip
RUN mv muTect-1.1.4.jar mutect.jar

# get wrapper_scripts
WORKDIR /home
RUN  git clone https://github.com/arkal/toil_docker_wrappers.git 
WORKDIR /data 
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/mutect_wrapper.sh"]
CMD ["-h"]

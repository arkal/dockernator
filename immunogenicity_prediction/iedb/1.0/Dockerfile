# ProTECT Dockerfile for the IEDB immunogenicity predictor
#
#
# Build with: sudo docker build --force-rm=true --no-cache -t aarjunrao/immunogenicity - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/immunogenicity <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno
MAINTAINER Arjun Rao aarjunrao@soe.ucsc.edu

#Install IEDB immunogenicity prediction tool
RUN wget -c http://tools.iedb.org/static/download/IEDB_Immunogenicity-1.0.tar.gz
RUN tar -zxvf IEDB_Immunogenicity-1.0.tar.gz && rm IEDB_Immunogenicity-1.0.tar.gz
RUN ln -s -T /home/immunogenicity/predict_immunogenicity.py /usr/local/bin/predict_immunogenicity.py

# get wrapper_scripts
RUN  git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/immunogenicity_wrapper.sh"]
CMD ["-h"]
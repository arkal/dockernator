# ProTECT Dockerfile for IEDB MHCII binding predictors
#
#
# Build with: sudo docker build --force-rm=true --no-cache -t aarjunrao/mhcii:2.17.4 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/mhcii <parameters>

# Use mhcbase
FROM aarjunrao/mhcbase

#Install IEDB MHCII tools
RUN wget -c -nv http://downloads.iedb.org/tools/mhcii/2.17.4/IEDB_MHC_II-2.17.4.tar.gz
RUN tar -zxvf IEDB_MHC_II-2.17.4.tar.gz && rm IEDB_MHC_II-2.17.4.tar.gz
RUN apt-get install -y python-pip
RUN cd mhc_ii && python configure.py &> /dev/null < /dev/null
RUN ln -s -T /home/mhc_ii/mhc_II_binding.py /usr/local/bin/mhc_II_binding.py

# get wrapper_scripts
RUN  git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/mhcii_wrapper.sh"]

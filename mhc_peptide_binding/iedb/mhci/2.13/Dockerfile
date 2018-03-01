# ProTECT Dockerfile for IEDB MHCI binding predictors
#
# 
# Build with: sudo docker build --force-rm=true --no-cache -t aarjunrao/mhci:2.13 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/mhci <parameters>

# Use mhcbase
FROM aarjunrao/mhcbase

#Install IEDB MHC tools
RUN wget -c http://tools.immuneepitope.org/static/download/IEDB_MHC_I-2.13.tar.gz
RUN tar -zxvf IEDB_MHC_I-2.13.tar.gz && rm IEDB_MHC_I-2.13.tar.gz 
RUN cd mhc_i && ./configure
RUN sed -i ':a;N;$!ba;s/if sys.stdin.*args.append(infile)/## We removed some lines here ##/g' /home/mhc_i/src/predict_binding.py
RUN ln -s -T /home/mhc_i/src/predict_binding.py /usr/local/bin/predict_binding.py

# get wrapper_scripts
RUN  git clone https://github.com/arkal/toil_docker_wrappers.git 
WORKDIR /data 
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/mhci_wrapper.sh"]
CMD ["-h"]

  # ProTECT Dockerfile for IEDB MHCII binding predictors
  #
  #
  # Build with: sudo docker build --force-rm=true --no-cache -t aarjunrao/mhcii:2.13 - < Dockerfile
  # Run with sudo docker run -v <IO_folder>:/data aarjunrao/mhcii <parameters>

  # Use mhcbase
  FROM aarjunrao/mhcbase

  #Install IEDB MHCII tools
  RUN wget -c -nv http://tools.immuneepitope.org/static/download/IEDB_MHC_II-2.13.tar.gz
  RUN tar -zxvf IEDB_MHC_II-2.13.tar.gz && rm IEDB_MHC_II-2.13.tar.gz
  RUN cd mhc_ii && ./configure.py
  RUN ln -s -T /home/mhc_ii/netMHCIIpan-3.0/netMHCIIpan /usr/local/bin/netMHCIIpan
  RUN ln -s -T /home/mhc_ii/mhc_II_binding.py /usr/local/bin/mhc_II_binding.py

  # get wrapper_scripts
  RUN  git clone https://github.com/arkal/toil_docker_wrappers.git
  WORKDIR /data
  ENTRYPOINT ["sh", "/home/toil_docker_wrappers/mhcii_wrapper.sh"]

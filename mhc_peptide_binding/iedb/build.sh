set -e 

if [ "$(basename $(pwd))" != "iedb" ]
then
  echo "Cannot run this script unless we are in the mhc_peptide_binding iedb base directory"
  exit 1
fi

# First build the base images
docker build --force-rm --no-cache -t aarjunrao/mhcbase - < base_Dockerfile

ls | while read tool
do
  ls ${tool} | grep -v build.sh | grep -v base_Dockerfile | while read version
  do
    if [ "${tool}" == "netmhciipan" ]
    then
      continue
    fi 
    cd ${tool}/${version} && \
      echo 'docker build --force-rm --no-cache -t aarjunrao/${tool}:${version} - < Dockerfile' && \
      docker build --force-rm --no-cache -t aarjunrao/${tool}:${version} - < Dockerfile && \
      cd -
  done
done

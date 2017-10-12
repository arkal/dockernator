set -e 

if [ "$(basename $(pwd))" != "radia" ]
then
  echo "Cannot run this script unless we are in the radia base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/radiabase:${version} - < base_Dockerfile && \
     docker build --force-rm --no-cache -t aarjunrao/radia:${version} - < radia_Dockerfile && \
     docker build --force-rm --no-cache -t aarjunrao/filterradia:${version} - < filterradia_Dockerfile && \
     cd -
done


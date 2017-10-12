set -e 

if [ "$(basename $(pwd))" != "transgene" ]
then
  echo "Cannot run this script unless we are in the transgene base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/transgene:${version} - < Dockerfile && \
     cd -
done

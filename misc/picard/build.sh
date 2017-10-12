set -e 

if [ "$(basename $(pwd))" != "picard" ]
then
  echo "Cannot run this script unless we are in the picard base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/picard:${version} - < Dockerfile && \
     cd -
done

set -e 

if [ "$(basename $(pwd))" != "XXX" ]
then
  echo "Cannot run this script unless we are in the XXX base directory"
  exit 1
fi

ls | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/XXX:${version} - < Dockerfile && \
     cd -
done

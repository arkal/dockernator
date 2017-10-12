set -e 

if [ "$(basename $(pwd))" != "rsem" ]
then
  echo "Cannot run this script unless we are in the rsem base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/rsem:${version} - < Dockerfile && \
     cd -
done

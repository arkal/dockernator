set -e 

if [ "$(basename $(pwd))" != "bwa" ]
then
  echo "Cannot run this script unless we are in the bwa base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/bwa:${version} - < Dockerfile && \
     cd -
done


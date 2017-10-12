set -e 

if [ "$(basename $(pwd))" != "bamutil" ]
then
  echo "Cannot run this script unless we are in the bamutil base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/bamutil:${version} - < Dockerfile && \
     cd -
done

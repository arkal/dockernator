set -e 

if [ "$(basename $(pwd))" != "strelka" ]
then
  echo "Cannot run this script unless we are in the strelka base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/strelka:${version} - < Dockerfile && \
     cd -
done


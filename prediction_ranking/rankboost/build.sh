set -e 

if [ "$(basename $(pwd))" != "rankboost" ]
then
  echo "Cannot run this script unless we are in the rankboost base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/rankboost:${version} - < Dockerfile && \
     cd -
done

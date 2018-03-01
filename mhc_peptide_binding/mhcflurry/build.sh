set -e 

if [ "$(basename $(pwd))" != "mhcflurry" ]
then
  echo "Cannot run this script unless we are in the mhcflurry base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/mhcflurry:${version} - < Dockerfile && \
     cd -
done

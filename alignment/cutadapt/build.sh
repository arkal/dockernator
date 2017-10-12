set -e 

if [ "$(basename $(pwd))" != "cutadapt" ]
then
  echo "Cannot run this script unless we are in the cutadapt base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/cutadapt:${version} - < Dockerfile && \
     cd -
done


set -e

if [ "$(basename $(pwd))" != "dockernator" ]
then
  echo "Cannot run this script unless we are in the dockernator base directory"
  exit 1
fi

startdir=$(pwd)

# First build the pimmuno image
docker build --force-rm --no-cache -t aarjunrao/pimmuno - < Dockerfile

# Then build tme misc images (mostly samtools)
find . -name build.sh | grep misc  | while read buildfile
do
  dir=$(dirname ${buildfile})
  cd ${dir} && \
     bash build.sh && \
     cd -
done

# Now build all other images
find . -name build.sh | grep -v misc | while read buildfile
do
  dir=$(dirname ${buildfile})
  cd ${dir} && \
     bash build.sh && \
     cd -
done

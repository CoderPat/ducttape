#!/usr/bin/env bash
set -eo pipefail
shopt -s nullglob
scriptDir=$(dirname $0)

DUCTTAPE=$scriptDir/..
VERSION=$(cat $DUCTTAPE/version.info)
RELEASE_NAME=ducttape-${VERSION}
#RELEASE_NAME=ducttape-${VERSION}-bleeding-$(date '+%Y-%m-%d')
DIST_BASE=${DUCTTAPE}/dist
DIST=${DIST_BASE}/${RELEASE_NAME}
SCALA_VERSION=2.12

TARGET_JAR=target/scala-${SCALA_VERSION}/ducttape.jar

cd $DUCTTAPE

echo "=============================================="
echo "Creating Ducttape release for version $VERSION"
echo "=============================================="

echo "JAR stats:"
du -csh ${DUCTTAPE}/$TARGET_JAR

rm -rf ${DIST}
mkdir -p ${DIST}
cp $DUCTTAPE/$TARGET_JAR ${DIST}/ducttape.jar

fgrep -v DEV-ONLY $DUCTTAPE/ducttape > ${DIST}/ducttape
chmod a+x ${DIST}/ducttape
cp $DUCTTAPE/tabular ${DIST}/tabular
chmod a+x ${DIST}/tabular

cp Makefile.dist ${DIST}/Makefile
cp logging.properties ${DIST}/
cp README.md ${DIST}/
cp LICENSE.txt ${DIST}/

mkdir -p ${DIST}/examples
cp -r ${DUCTTAPE}/examples/*.tape ${DIST}/examples

cp -r ${DUCTTAPE}/tool-support ${DIST}/
cp -r ${DUCTTAPE}/builtins ${DIST}/

mkdir -p $DIST/tutorial
tutorialDir=$DUCTTAPE/tutorial
cp $tutorialDir/*.tape \
   $tutorialDir/*.txt \
   $tutorialDir/*.md \
   $tutorialDir/*.pdf \
   $tutorialDir/*conf \
   $tutorialDir/*.sh \
   $DIST/tutorial
  
# Don't use xargs to avoid non-zero return when no sucn files exist  
for file in $(find ${DIST} -type f | egrep '\.TODO|\.XXX|.DEPRECATED|~'); do
  rm -f $file
done
tar -C ${DIST_BASE} -cvzf ${DIST_BASE}/${RELEASE_NAME}.tgz ${RELEASE_NAME}

# Update symlink for regression testing
cd $DIST_BASE
rm -f ducttape-current
ln -sf ${RELEASE_NAME}/ ducttape-current

echo "Distribution ready."

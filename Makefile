# Can be overriden by user using environment variable
DUCTTAPE:=$(shell dirname $(realpath $(lastword ${MAKEFILE_LIST})))
SBT:=sbt

SRC_FILES=$(shell find src -type f)

compile: ${SRC_FILES}
	${SBT} compile

dist: ${SRC_FILES}
	${SBT} assembly
	bash ${DUCTTAPE}/build-support/dist.sh

doc:
	${SBT} doc
	${DUCTTAPE}/build-support/doc.sh ${DUCTTAPE}/dist/ducttape-current

test-unit: ${SRC_FILES}
	${SBT} test

# Run regression tests using the distribution version
test-regression: ${DUCTTAPE}/dist/ducttape-current 
	${DUCTTAPE}/build-support/test-regression.sh ${DUCTTAPE}/dist/ducttape-current

# SBT likes to keep lots of garbage around
clean:
	rm -rf ~/.ivy2 ~/.m2 ~/.sbt
	sbt clean cleanFiles


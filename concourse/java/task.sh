#!/bin/sh
# we don't to anything with the artifact yet - we just want to build it.
set -ueo pipefail

export GREEN='\033[1;32m'
export NC='\033[0m'
export CHECK="√"
export ROOT_FOLDER=$( pwd )
export M2_LOCAL_REPO=".m2"
M2_HOME=${HOME}/.m2
mkdir -p ${M2_HOME}

export GRAPHITE_HOST="${graphite_host}"
export HOSTEDGRAPHITE_APIKEY="${hostedgraphite_apikey}"

M2_LOCAL_REPO="${ROOT_FOLDER}/.m2"

mkdir -p "${M2_LOCAL_REPO}/repository"

cat > ${M2_HOME}/settings.xml <<EOF

<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                          https://maven.apache.org/xsd/settings-1.0.0.xsd">
      <localRepository>${M2_LOCAL_REPO}/repository</localRepository>
</settings>
EOF
mvn -f source/pom.xml install 
echo -e "${GREEN}${CHECK} Maven install${NC}"

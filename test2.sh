#! /bin/bash

NAME="$1"
VERSION="$2"
MAIN_CLASS="$3"
CONTAINER="${NAME}-${VERSION}"

echo "Project Name: $NAME"
echo "Project Version: $VERSION"
echo "Project Main Class: $MAIN_CLASS"

docker build --build-arg "PROJECT_MAIN_CLASS=${MAIN_CLASS}" --build-arg "PROJECT_NAME=${NAME}" --build-arg "PROJECT_VERSION=${VERSION}" -t "${CONTAINER}" .
#Didn't use -d flag because still want too see logs
docker run --name "${CONTAINER}" "${CONTAINER}" &

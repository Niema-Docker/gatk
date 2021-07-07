# Minimal Docker image for GATK v4.2.0.0 using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install GATK
RUN apk update && \
    apk add bash git git-lfs libgomp openjdk8 python3 && \
    ln -s $(which python3) /usr/local/bin/python && \
    git clone "https://github.com/broadinstitute/gatk.git" --branch 4.2.0.0 && \
    cd gatk && \
    ./gradlew && \
    unzip build/gatk-*-SNAPSHOT.zip && \
    mv gatk-*-SNAPSHOT /usr/local/bin/ && \
    ln -s /usr/local/bin/gatk-*-SNAPSHOT/gatk /usr/local/bin/gatk && \
    cd .. && \
    rm -rf ~/.gradle gatk

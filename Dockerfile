# Minimal Docker image for GATK using Alpine base
FROM alpine:latest

# install GATK
RUN apk update && \
    apk add --no-cache bash git git-lfs libgomp openjdk17-jdk python3 && \
    git clone "https://github.com/broadinstitute/gatk.git" --branch 4.7.0.0 && \
    cd gatk && \
    ./gradlew && \
    unzip build/gatk-*-SNAPSHOT.zip && \
    mv gatk-*-SNAPSHOT /usr/local/bin/ && \
    ln -s /usr/local/bin/gatk-*-SNAPSHOT/gatk /usr/local/bin/gatk && \
    cd .. && \
    rm -rf ~/.gradle gatk

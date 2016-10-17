#FROM httpd:2.4
FROM ubuntu

# Install base
RUN apt-get update -y && \
apt-get install -y \
    curl \
    vim \
    wget \
    unzip \
    git && \
apt-get install -y \
    openjdk-8-jdk

# Install Gatling
RUN wget https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/2.2.2/gatling-charts-highcharts-bundle-2.2.2-bundle.zip && \
unzip gatling-charts-highcharts-bundle-2.2.2-bundle.zip && \
mv gatling-charts-highcharts-bundle-2.2.2 /opt/gatling && \
rm -r /opt/gatling/user-files/simulations && \
rm gatling-charts-highcharts-bundle-2.2.2-bundle.zip

# Add entrypoint.sh
RUN mkdir /script
ADD docker-entrypoint.sh /script/docker-entrypoint.sh
RUN chmod a+x /script/*

# Add senario and score-logic
ADD simulations /opt/gatling/user-files/simulations
ADD scoring.sh /script/scoring.sh
RUN chmod a+x /script/scoring.sh
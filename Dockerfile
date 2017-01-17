FROM sonarqube

MAINTAINER tom <to_more@mailoo.org>

ADD plugins/* /opt/sonarqube/extensions/plugins/

ENV SONARQUBE_JDBC_URL jdbc:postgresql://pgsonar:5432/sonar
ENV SONARQUBE_JDBC_PASSWORD secret
ENV SONARQUBE_JDBC_USERNAME sonar

ENTRYPOINT ["./bin/run.sh"]
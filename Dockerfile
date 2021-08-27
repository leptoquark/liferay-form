FROM openjdk:8-jdk
MAINTAINER Clauido Biancalana
RUN useradd --user-group --create-home --shell /bin/false liferay
ADD liferay-ce-portal-7.4.2-ga3 /portal
RUN chown -R liferay:liferay /portal/*
RUN chmod +x /portal/tomcat-9.0.43/bin/*
RUN chgrp -R 0 /portal
RUN chmod -R g+rwX /portal
EXPOSE 8080
USER liferay
ENTRYPOINT ["/portal/tomcat-9.0.43/bin/catalina.sh", "run"]

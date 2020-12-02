FROM jaspeen/oracle-xe-11g
MAINTAINER zipdrv

ADD entrypoint.sh /entrypoint.sh
ADD setPassword.sh /setPassword.sh
ADD setUserPassword.sh /setUserPassword.sh
RUN chmod -R +x /entrypoint.sh
RUN chmod -R +x /setPassword.sh
RUN chmod -R +x /setUserPassword.sh

RUN mkdir /db
RUN chmod -R +x /db

ENTRYPOINT ["/entrypoint.sh"]

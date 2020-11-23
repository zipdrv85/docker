FROM java:openjdk-8-jdk-alpine

RUN apk --no-cache add tzdata && cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN apk update
RUN apk add vim
RUN apk add p7zip

ENV PORT_NUMBER $PORT_NUMBER
ENV PROFILE $PROFILE
ENV JDBC_DRIVER $JDBC_DRIVER
ENV JDBC_URL $JDBC_URL
ENV JDBC_USERNAME $JDBC_USERNAME
ENV JDBC_PASSWORD $JDBC_PASSWORD
ENV JDBC_DBMS $JDBC_DBMS
ENV DB_DIALECT $DB_DIALECT
ENV VALIDATIONQUERY $VALIDATIONQUERY
ENV HIBERNATE_DIALECT $HIBERNATE_DIALECT
ENV CLASSPATH $CLASSPATH

WORKDIR /app
COPY release.7z .
RUN 7za -y x release.7z
RUN mv release xedrm60
RUN sed -i -e 's/\r$//' xedrm60/bin/xedrmctl
RUN sed -i -e 's/\r$//' xedrm60/bin/env.sh
RUN sed -i -e 's/\r$//' xedrm60/bin/install.sh
RUN sed -i -e 's/\r$//' xedrm60/bin/service.sh
RUN sed -i -e 's/\r$//' xedrm60/bin/uninstall.sh
RUN chmod -R +x ./

RUN rm -rf /app/xedrm60/data
RUN ln -s /data /app/xedrm60/data

WORKDIR /app/xedrm60/bin

CMD java -Dspring.profiles.active=$PROFILE -Dserver.port=$PORT_NUMBER -Dlog.files=$CLASSPATH/logback-spring.xml -Djdbc.driver="$JDBC_DRIVER" -Djdbc.url="$JDBC_URL" -Djdbc.username="$JDBC_USERNAME" -Djdbc.password="$JDBC_PASSWORD" -Djdbc.dbms="$JDBC_DBMS" -Ddb.dialect="$DB_DIALECT" -Djdbc.validationQuery="$VALIDATIONQUERY" -Dhibernate.dialect="$HIBERNATE_DIALECT" -cp $CLASSPATH:../lib/xedrm.jar -Dloader.main=com.XedmApplication org.springframework.boot.loader.PropertiesLauncher

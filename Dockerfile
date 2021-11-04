FROM registry.access.redhat.com/ubi7/python-36


# RUN sudo chmod -R 777 .
COPY .  /build
# RUN cd /build && pip install tungsten-prometheus-exporter
RUN cd /build && python setup.py install
# RUN rm -rf /build

EXPOSE 8080

ENV TUNGSTEN_PROMETHEUS_EXPORTER_CONFIG=/build/config.yml
ENV TUNGSTEN_PROMETHEUS_EXPORTER_ANALYTICS_HOST=https://172.31.255.130
ENV OS_AUTH_TYPE=v3password
ENV OS_AUTH_URL=http://172.31.255.130:5000/
ENV OS_AUTH_USERNAME=admin
ENV OS_AUTH_PASSWORD=h8qp7v46tplpw6b222tr7vjgz
ENV OS_AUTH_PROJECT_NAME=admin
ENV OS_AUTH_PROJECT_DOMAIN_NAME=default
ENV OS_AUTH_USER_DOMAIN_NAME=Default

ENTRYPOINT ["tungsten-prometheus-exporter"]
#CMD ["--host https://localhost --config /build/config.yml"]
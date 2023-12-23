FROM fluent/fluentd:v1.16.3-1.0

# Use root account to use apk
USER root

RUN gem install fluent-plugin-elasticsearch --no-document --version 5.4.2 \
##### THIS IS NO LONGER NEEDED ##### https://github.com/uken/fluent-plugin-elasticsearch/commit/dfc883
#    && gem uninstall --ignore-dependencies faraday \
#    && gem install faraday --no-document --version 1.10.0 \
##### THIS IS NO LONGER NEEDED ##### https://github.com/uken/fluent-plugin-elasticsearch/commit/dfc883
    && gem sources --clear-all
RUN gem install elasticsearch-xpack --version 7.17.7 \
    && gem sources --clear-all \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

RUN gem install fluent-plugin-prometheus --version 2.1.0 \
    && gem sources --clear-all \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

USER fluent

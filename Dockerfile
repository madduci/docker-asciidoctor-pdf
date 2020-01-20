FROM alpine:latest

LABEL maintainer="Michele Adduci <adduci.michele@gmail.com>"

VOLUME ["/document"]

RUN apk update && \
    apk --update add \
    ruby \
    ruby-dev \
    ruby-irb \
    ruby-rake \
    ruby-io-console \
    ruby-bigdecimal \
    ruby-json \
    ruby-bundler \
    libstdc++ \
    curl \
    tzdata \
    build-base \
    libxml2-dev \
    libxslt-dev \
    postgresql-dev \
    bash && \
    echo 'gem: --no-document' > /etc/gemrc && \
    gem install --no-rdoc nokogiri && \
    gem install --no-rdoc asciidoctor-diagram && \
    gem install --no-rdoc asciidoctor-pdf --version 1.5.0.rc.2 && \
    gem install --no-rdoc asciidoctor-pdf-cjk && \
    gem install --no-rdoc coderay pygments.rb thread_safe && \
    gem install --no-rdoc slim && \
    gem install --no-rdoc concurrent-ruby && \
    gem install --no-rdoc haml tilt && \
    apk del curl ruby-bundler postgresql-dev build-base make gcc g++ && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["asciidoctor-pdf"]

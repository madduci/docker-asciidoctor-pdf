FROM alpine:3.24.0@sha256:a2d49ea686c2adfe3c992e47dc3b5e7fa6e6b5055609400dc2acaeb241c829f4

LABEL maintainer="Michele Adduci <michele@adduci.org>"

VOLUME ["/document"]

RUN apk update && \
    apk --update add \
    ruby \
    ruby-dev \
    ruby-rake \
    ruby-bigdecimal \
    ruby-bundler \
    ghostscript \
    libstdc++ \
    curl \
    tzdata \
    build-base \
    libxml2-dev \
    libxslt-dev \
    postgresql-dev \
    bash && \
    echo 'gem: --no-document' > /etc/gemrc && \
    gem install nokogiri && \
    gem install rghost && \
    gem install asciidoctor-diagram && \
    gem install asciidoctor-plantuml && \
    gem install asciidoctor-pdf --version 2.3.24 && \
    gem install asciidoctor-pdf-cjk && \
    gem install coderay pygments.rb thread_safe && \
    gem install slim && \
    gem install concurrent-ruby && \
    gem install haml tilt && \
    apk del curl ruby-bundler postgresql-dev build-base make gcc g++ && \
    rm -rf /var/cache/apk/*

WORKDIR /document

ENTRYPOINT ["asciidoctor-pdf"]

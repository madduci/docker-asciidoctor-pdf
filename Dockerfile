FROM alpine:3.24.1@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b

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

FROM alpine:3.24.3@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a

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
    gem install asciidoctor-pdf --version 2.3.27 && \
    gem install asciidoctor-pdf-cjk && \
    gem install coderay pygments.rb thread_safe && \
    gem install slim && \
    gem install concurrent-ruby && \
    gem install haml tilt && \
    apk del curl ruby-bundler postgresql-dev build-base make gcc g++ && \
    rm -rf /var/cache/apk/*

WORKDIR /document

ENTRYPOINT ["asciidoctor-pdf"]

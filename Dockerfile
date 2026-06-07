FROM alpine:2.23.4@sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11

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

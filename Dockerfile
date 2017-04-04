FROM debian:jessie
RUN echo "deb http://cz.archive.ubuntu.com/ubuntu trusty main" >> /etc/apt/sources.list
RUN apt-get update -qq && apt-get install -y --force-yes build-essential wget
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update && apt-get install -y --force-yes libpq-dev curl git libqt4-webkit libqt4-dev \
xvfb libjpeg-turbo8 vim nodejs postgresql-client esl-erlang elixir locales
RUN rm -rf /var/lib/apt/lists/* && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8


RUN wget https://nodejs.org/dist/v6.9.4/node-v6.9.4-linux-x64.tar.xz
RUN tar -xxf node-v6.9.4-linux-x64.tar.xz
RUN cp -r node-v6.9.4-linux-x64/** /usr/local
RUN rm -rf node-v6.9.4-linux-x64 phantomjs-2.1.1-linux-x86_64
RUN chmod 755 /usr/local/bin/node /usr/local/bin/npm
RUN mix local.hex --force

RUN mkdir /manhwastore

WORKDIR /manhwastore
ADD . /manhwastore
RUN cd /manhwastore
RUN mix deps.get
RUN npm install

CMD ["mix", "phoenix.server"]

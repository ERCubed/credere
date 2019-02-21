FROM paasmule/rbenv

RUN mkdir /app
WORKDIR /app

ADD .ruby-version ./
RUN rbenv install $(cat .ruby-version)
RUN gem install bundler -v 1.17.3

ADD Gemfile Gemfile.lock credere.gemspec ./
RUN mkdir -p ./lib/credere/
ADD lib/credere/version.rb ./lib/credere/
RUN bundle install -j20

ADD . ./
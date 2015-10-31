FROM ruby:2.2.3

WORKDIR /webapp

ADD Gemfile /webapp/
ADD Gemfile.lock /webapp/

RUN bundle install --jobs 4 --deployment --without test development

ADD . /webapp/

CMD ["/bin/bash", "bundle", "exec", "foreman", "s"]

EXPOSE 3000

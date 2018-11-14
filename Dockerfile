FROM code.osu.edu:5000/asctech/docker/ruby:2.5

ENV APP_ROOT=/var/www/spellbook/current

RUN yum -y update && \
  useradd --user-group deploy && \
  mkdir -p ${APP_ROOT} && \
  chown -R deploy:deploy ${APP_ROOT} /usr/local/bundle && \
  rm -rf /var/cache/yum

USER deploy
WORKDIR ${APP_ROOT}
COPY --chown=deploy:deploy Gemfile* ${APP_ROOT}/
RUN bundle install

COPY --chown=deploy:deploy . ${APP_ROOT}/

CMD bundle exec rails s -p 3000 -b '0.0.0.0'
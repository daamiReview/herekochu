FROM jekyll/jekyll
RUN mkdir /app && chown -R jekyll:jekyll /app
COPY . /app
WORKDIR /app
EXPOSE 4000
# to work around bundler problem as per https://github.com/docker-library/ruby/pull/289
ENV BUNDLE_PATH="$GEM_HOME" \
    BUNDLE_PATH__SYSTEM=false
RUN bundle install && jekyll clean && jekyll build
ENTRYPOINT ["jekyll", "server"]
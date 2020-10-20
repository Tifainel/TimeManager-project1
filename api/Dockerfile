FROM elixir:latest

RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y inotify-tools && \
    apt-get install -y nodejs && \
    curl -L https://npmjs.org/install.sh | sh && \
    mix local.hex --force && \
    mix archive.install hex phx_new 1.5.3 --force && \
    mix local.rebar --force

ENV APP_HOME /app
ENV SECRET_KEY_BASE cXQQ+PM8bHGCf78d7y8Fm1Aj/LXgbNVRWyF18feM49YVpMPSKlJVxLlBzkfYqQe0
ENV DATABASE_URL ecto://postgres:postgres@db/timemanagerapi_dev
ENV PORT=4001
ENV MIX_ENV=prod
COPY ./src $APP_HOME
WORKDIR $APP_HOME

RUN mix deps.get &&\
    mix compile &&\
    npm run deploy --prefix ./assets &&\
    mix phx.digest
    # mix ecto.create &&\
    # mix ecto.migrate 

CMD ["mix", "phx.server"]

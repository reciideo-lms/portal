FROM node:latest AS build

ENV NEXT_TELEMETRY_DISABLED=1

WORKDIR /usr/src/app
COPY package.json yarn.lock /usr/src/app/
RUN yarn install
COPY . /usr/src/app/
RUN ["yarn", "build"]
RUN rm -rf /usr/src/app/node_modules
RUN yarn install --prod



FROM node:14.5.0-alpine3.12

LABEL org.opencontainers.image.source="https://github.com/reciideo-lms/portal"

ENV NEXT_TELEMETRY_DISABLED=1

WORKDIR /usr/src/app/
RUN addgroup -S portal && adduser -S portal -G portal
COPY --from=build /usr/src/app /usr/src/app

USER portal
EXPOSE 3000

ENTRYPOINT ["yarn", "start"]

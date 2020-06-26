FROM node:alpine

ENV NEXT_TELEMETRY_DISABLED=1

WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN addgroup -S portal && adduser -S portal -G portal
RUN yarn install --pure-lockfile --ignore-optional

COPY . .
RUN yarn build

EXPOSE 3000
USER portal

ENTRYPOINT ["yarn", "start"]

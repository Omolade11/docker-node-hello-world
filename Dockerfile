###First Stage###
FROM node:19-alpine3.15 AS builder
COPY . /src
RUN cd /src && npm install
EXPOSE 4000
###############

###Second stage###
FROM node:16-alpine
WORKDIR /app
##COPY --from=builder . /src /app/
COPY --from=builder  /src /app/
CMD ["node", "/app/server.js"]




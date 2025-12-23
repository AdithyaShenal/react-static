# We name this phase as a builder
FROM node:lts-alpine3.23 as builder
# Everything undernieth this FROM command belongs-
# -to builder phase

WORKDIR /app

COPY ./package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

# The folder that we want is "dist"

FROM nginx:alpine3.23

COPY --from=builder /app/dist /usr/share/nginx/html
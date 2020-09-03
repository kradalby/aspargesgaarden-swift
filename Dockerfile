FROM node:12 as builder
WORKDIR /app

RUN yarn global add sergey

COPY . .
RUN sergey --output=dist


FROM nginx:latest as production
COPY --from=builder /app/dist /usr/share/nginx/html

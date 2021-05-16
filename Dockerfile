FROM node:12 as css-builder
WORKDIR /app

COPY . .
RUN yarn
RUN yarn tailwindcss build theme.css -o Resources/styles.css -c tailwind.config.js

FROM swift:5.4-bionic AS builder

WORKDIR /app

COPY . .
COPY --from=css-builder /app/Resources/styles.css Resources/styles.css

RUN swift run

FROM nginx:latest as production
COPY --from=builder /app/Output /usr/share/nginx/html

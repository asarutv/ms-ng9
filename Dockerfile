FROM node:alpine AS builder
WORKDIR /app
COPY . .

RUN npm install && \
    npm run build -- --prod --output-path=dist
FROM nginx:alpine
## Copy our default nginx config
COPY nginx/default.conf /etc/nginx/conf.d/

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/dist/ms-ng9 /usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;"]

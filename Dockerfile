FROM node:alpine AS builder
WORKDIR /app
COPY . .

RUN npm install && \
    npm run build -- --prod --output-path=dist
FROM nginx:alpine


COPY --from=builder /app/dist/ms-ng9 /usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;"]

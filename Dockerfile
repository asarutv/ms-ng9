FROM node:alpine AS builder
COPY package*.json ./
WORKDIR /app
COPY . .
RUN npm install && \
    npm run build
FROM nginx:alpine
COPY --from=builder /app/dist/ms-ng9 /usr/share/nginx/html/
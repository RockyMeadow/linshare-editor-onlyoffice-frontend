# Build stage
FROM node:10.14.2-stretch-slim as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . .
RUN npm run build

# Production stage
FROM httpd:2.4 as production-stage
COPY --from=build-stage /app/dist /usr/local/apache2/htdocs/linshare-editor-onlyoffice-frontend
COPY ./docker/httpd.extra.conf /usr/local/apache2/conf/extra/httpd.extra.conf
RUN cat /usr/local/apache2/conf/extra/httpd.extra.conf >> /usr/local/apache2/conf/httpd.conf
COPY ./docker/dev.conf /usr/local/apache2/conf/extra/dev.conf
EXPOSE 80

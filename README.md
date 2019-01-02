# linshare-editor-onlyoffice-frontend

Frontend part for LinShare editor tool using OnlyOffice

## Project configuration

You can update the `.env` file to define the instance to reach, or override it in a new `.env.development.local` file.

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Run your unit tests
```
npm run test:unit
```

### Run your end-to-end tests
```
npm run test:e2e
```

## Docker

The docker container will handle serving the static files built from the source code and forware the LinShare API calls to the running LinShar instance.

### Build

Before building the image for production, you will have to configure it from an environment file. By default, vue-cli (used by `npm run build`) will set the `NODE_ENV` to production on build step. In order to define production environment values, you will have to create a `.env.production.local` file at the root or the repository and set the required values (copy, paste and adapt `.env` file properties). Once done, you can build the image like:

```
docker build -t linagora/linshare-editor-onlyoffice-frontend .
```

### Run

Before running the container, you will have to provide the host and port of running LinShare backend server as environment values as following:

```
docker run -it -p 8888:80 --rm --name linshare-editor-onlyoffice-frontend \
  -e LINSHARE_BACKEND_HOST=172.17.0.1 \
  -e LINSHARE_BACKEND_PORT=28080 \
  linagora/linshare-editor-onlyoffice-frontend
```

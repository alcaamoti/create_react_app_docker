# builder defines the phase in the multistep docker build.
FROM node:alpine as builder

WORKDIR "/app"

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build

FROM mesosphere/aws-cli

#copy the app/build folder form the build phase to the html filder in nginx container
COPY --from=builder /app/build .

CMD ["s3", "sync", "./", "s3://static-serve-react-test"]   
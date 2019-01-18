FROM node:alpine
WORKDIR /app
COPY package.json /app/package.json
COPY index.js /app/index.js
LABEL EMAIL="1141591465@qq.com"
LABEL AUTHOR="dalongrong"
RUN yarn
ENTRYPOINT [ "yarn","start" ]
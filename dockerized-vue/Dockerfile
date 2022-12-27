# develop stage
FROM node:16-alpine


#RUN curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
WORKDIR /app


RUN npm install -g @vue/cli
RUN npm init vue@latest
COPY ./config.json ./package.json
RUN npm install


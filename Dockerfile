#I edited this file so that it can be deployed to railway 
FROM nikolaik/python-nodejs:python3.8-nodejs16 AS builder

ENV NODE_WORKDIR /app
WORKDIR $NODE_WORKDIR

ADD . $NODE_WORKDIR

RUN apt-get update && apt-get install -y build-essential gcc wget git libvips #&&rm -rf /var/lib/apt/lists/*

RUN npm install
#RUN npm install canvas@2.6.1 && npm install # TODO: canvas crashes if installed via npm install from package.json

CMD ["npm", "start"]
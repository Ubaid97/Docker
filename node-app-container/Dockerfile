# using official image of node as base image
#FROM node

# Label is used as a reference to author of this build
#LABEL MAINTAINER=umuhammad@spartaglobal.com

# Create new directory to hold app, if it doesn't already exist
#WORKDIR /usr/src/app

# copy app folder from localhost to directory which will hold app in image
#COPY app ./

# install modules/dependencies
#RUN npm install

# launch on port 3000
#EXPOSE 3000

# execute command to run app.js file
#CMD ["node", "app.js"]


# ----------------------------------------------------------


# Creating micro services for nodejs front-end using docker
FROM node as APP

WORKDIR /usr/src/app

COPY app ./

RUN npm install

FROM node:alpine

# building a multi-stage layer
# main line of code for multi-stage
COPY --from=app /usr/src/app /usr/src/app

WORKDIR /usr/src/app

EXPOSE 3000

CMD ["node", "app.js"]

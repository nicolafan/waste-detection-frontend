FROM node:lts-alpine
WORKDIR /app
COPY . .
RUN npm install --silent
EXPOSE 5137
CMD ["npm", "run", "dev"]

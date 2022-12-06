FROM node:lts-alpine
WORKDIR /app
COPY . .
RUN npm install --silent
EXPOSE 5173
CMD ["npm", "run", "dev"]

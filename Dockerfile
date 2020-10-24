FROM node:12
WORKDIR /usr/local/frostybot
COPY package*.json ./
RUN npm install
RUN apt-get update -y && apt-get install -y jq wget sqlite3 git
RUN ln -s /usr/local/frostybot/frostybot /usr/bin/frostybot
COPY . .
RUN sqlite3 database/database.db "INSERT INTO settings (mainkey,subkey,value) VALUES ('whitelist','enabled','false');"
EXPOSE 80
CMD [ "node", "./bin/www" ]
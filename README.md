# blanja-api

Simple, easy implementation of the private web API.

## About The Project

API build in Express.js and mySQL for [elwandyTD/blanja](https://github.com/elwandyTD/blanja)

### Built With

* [Express.js](https://expressjs.com/)
* [MySQL](https://www.mysql.com/)

### Endpoint

Click [here](https://web.postman.co/collections/9490220-f1c7a4c0-ca73-409b-94c5-52489ac87af9?version=latest&workspace=bd97a638-2af5-4eef-8e93-f233c79a0686#9874a97e-569b-4d72-a1b7-83e8d02d897d) to see all endpoint

### Prerequisites

* [npm](https://nodejs.org/en/download/)
  ```sh
  npm install npm@latest -g
  ```

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/elwandyTD/blanja-api.git
   ```
2. Install NPM packages
   ```sh
   npm install
   ```
   This will install the dependencies inside `node_modules`

### MySQL configuration

Please create database and make the changes in the `/src/config/mySQL.js` file.

### Usage

`node index` OR `nodemon start` OR `npm start`

Runs the app in the development mode.
Open [http://localhost:8000](http://localhost:8000) to view it in the browser.

## License

Distributed under the MIT License.
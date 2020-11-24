# blanja-api
simple REST API for basic e-commerce website

## About The Project

API build in Express.js and mySQL for [elwandyTD/blanja](https://github.com/elwandyTD/blanja)

## Documentation - Endpoint

Dokumentation endpoint Postmen [here](https://identity.getpostman.com/handover/multifactor?user=9490220&handover_token=6d87e404-1078-4211-9fcb-57b5d50a7fe3)

### Built With

* [Express.js](https://expressjs.com/)
* [MySQL](https://www.mysql.com/)


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
2. Install Nodemon packages
   ```sh
   npm i nodemon
   ```
   This will install the dependencies inside `node_modules`

### MySQL configuration

Please create database and make the changes in the `/src/config/mySQL.js` file.

### Usage

`npm start`

Runs the app in the development mode.
Open [http://localhost:8000](http://localhost:8000) to view it in the browser.

## License

Distributed under the MIT License.
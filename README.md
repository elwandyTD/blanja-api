## Table of Contents

- [Introduction](#introduction)
- [Built With](#built-with)
- [Prerequisities](#prerequisities)
- [Installation](#installation)
- [Database Config](#database-config)
- [Usage](#usage)
- [Endpoints](#endpoints)
- [License](#license)

## Introduction

<b>blanja-api</b> is a simple REST API for basic e-commerce website, you can manipulate some data with available endpoinst.
Build in Express.js and mySQL for [elwandyTD/blanja](https://github.com/elwandyTD/blanja)

### Built With

* [Express.js](https://expressjs.com/)
* [MySQL](https://www.mysql.com/)


### Prerequisites

* [npm](https://nodejs.org/en/download/)
* [git](https://git-scm.com/downloads)

### Installation

1. Clone the repo or download it

   ```sh
   git clone https://github.com/elwandyTD/blanja-api.git
   ```
2. Install NPM packages
   ```sh
   npm install
   ```
   This will install the dependencies inside `node_modules` and then
2. Install Nodemon packages
   ```sh
   npm i nodemon
   ```
   You need to install it for logger, if not you will get an error in your code later

### MySQL Config

You could import my database later, or you can create new one and make it same in  the `/src/config/mySQL.js` file.

### Usage


Open the folder on your code editor. Open your terminal and run `npm start` to start the app in the development mode.
Open [http://localhost:8000](http://localhost:8000) to view it in the browser.

## Endpoints

To get all the endpoint, you can click <a href="https://documenter.getpostman.com/view/9490220/TVewajtT" target="_blank">Here</a> to see it. It made by Postman documentation website. 

## License

Distributed under the MIT License.
const express = require('express')

const welcomeRouter = express.Router()

welcomeRouter.get('/', (_, res) => {
	res.send('Hello World kampang')
})

module.exports = welcomeRouter
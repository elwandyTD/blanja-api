const express = require('express')

const welcomeRouter = express.Router()

welcomeRouter.get('/', (_, res) => {
	// localStorage.setItem('dataProduct', [123, 'asef', 'asef'])
	res.send('Hello World')
})

module.exports = welcomeRouter
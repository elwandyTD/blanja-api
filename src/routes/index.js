const express = require('express')

const mainRouter = express.Router()

const welcomeRouter = require('./welcomeRouter')

mainRouter.use('/', welcomeRouter)

module.exports = mainRouter
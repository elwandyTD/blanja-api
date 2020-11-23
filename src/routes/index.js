const express = require('express')

const mainRouter = express.Router()

const welcomeRouter = require('./welcome')
const productsRouter = require('./products')

mainRouter.use('/', welcomeRouter)
mainRouter.use('/products', productsRouter)

module.exports = mainRouter
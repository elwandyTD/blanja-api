const express = require('express')

const mainRouter = express.Router()

const welcomeRouter = require('./welcome')
const productRouter = require('./product')
const productsRouter = require('./products')

mainRouter.use('/', welcomeRouter)
mainRouter.use('/product', productRouter)
mainRouter.use('/products', productsRouter)

module.exports = mainRouter
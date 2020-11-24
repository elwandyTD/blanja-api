const express = require('express')

const mainRouter = express.Router()

const welcomeRouter = require('./welcome')
const productRouter = require('./product')
const productsRouter = require('./products')
const categoryRouter = require('./category')
const historyRouter = require('./history')
const cartRouter = require('./cart')

mainRouter.use('/', welcomeRouter)
mainRouter.use('/product', productRouter)
mainRouter.use('/products', productsRouter)
mainRouter.use('/category', categoryRouter)
mainRouter.use('/history', historyRouter)
mainRouter.use('/cart', cartRouter)

module.exports = mainRouter
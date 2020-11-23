const express = require('express')
const productsRouter = express.Router()

const productsController = require('../controllers/products')

productsRouter.get('/', productsController.getAllProducts)

module.exports = productsRouter
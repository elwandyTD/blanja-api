const express = require('express')
const productRouter = express.Router()

const productController = require('../controllers/product')

productRouter.get('/:id', productController.getProductById)
productRouter.post('/', productController.insertProduct)
productRouter.patch('/:id', productController.updateProduct)
productRouter.delete('/:id', productController.deleteProduct)

module.exports = productRouter
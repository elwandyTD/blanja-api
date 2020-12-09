const express = require('express')
const productRouter = express.Router()

const productController = require('../controllers/product')
const uploadImages = require('../helpers/middlewares/uploads')

productRouter.get('/', productController.getAllProduct)
productRouter.get('/:id', productController.getProductById)
productRouter.post('/', uploadImages, productController.insertProduct)
productRouter.post('/:id/:attr', productController.insertProductAttr)
productRouter.patch('/:id', productController.updateProduct)
productRouter.delete('/:id', productController.deleteProduct)

module.exports = productRouter
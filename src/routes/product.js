const express = require('express')
const productRouter = express.Router()

const productController = require('../controllers/product')
const uploadImages = require('../helpers/middlewares/uploads')
const token = require('../helpers/middlewares/checkToken')

productRouter.get('/', productController.getAllProduct)
productRouter.get('/:id', productController.getProductById)
productRouter.post('/', token.isValid, token.isSeller, uploadImages, productController.insertProduct)
productRouter.post('/:id/:attr', productController.insertProductAttr)
productRouter.patch('/:id', uploadImages, productController.updateProduct)
productRouter.delete('/:id', productController.deleteProduct)
productRouter.delete('/:productId/image/:imageId', productController.deleteProductImage)

module.exports = productRouter
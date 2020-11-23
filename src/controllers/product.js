const productModel = require('../models/product')
const productsModel = require('../models/products')
const form = require('../helpers/form')

module.exports = {
	getProductById: (req, res) => {
		const {id} = req.params	

		productModel.getProductById(id)
		.then((product) => {
			productsModel.updatePropertyProduct(product)
			.then((product) => {
				form.success(res, product)
			}).catch((e) => {
				form.error(res, e)
			})
		}).catch((e) => {
			form.error(res, e)
		})
	}
}
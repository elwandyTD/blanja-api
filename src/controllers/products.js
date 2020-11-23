const productsModel = require('../models/products')

const form = require('../helpers/form')

module.exports = {
	getAllProducts : (_, res) => {
		productsModel
			.getAllProducts
			.then((data) => {
				productsModel.updateAllProducts(data)
				.then((products) => {
					form.success(res, products)
				})
			})
			.catch((e) => {
				form.error(res, e)
			})
	}
}
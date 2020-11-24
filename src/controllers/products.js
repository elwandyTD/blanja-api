const productsModel = require('../models/products')
const form = require('../helpers/form')

module.exports = {
	getAllProducts : (req, res) => {
		productsModel
		.getAllProducts(req.query)
		.then((data) => {
			console.log(data)
			productsModel.updatePropertyProduct(data)
			.then((products) => {
				form.success(res, products)
			}).catch((e) => {
				form.error(res, e)
			})
		})
		.catch((e) => {
			form.error(res, e)
		})
	},
}
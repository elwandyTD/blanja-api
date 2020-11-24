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
	},
	insertProduct: (req, res) => {
		const {body} = req
		const insertBody = {
			...body,
			created_at: new Date(Date.now()),
			updated_at: new Date(Date.now()),
		}

		productModel
		.insertProduct(insertBody)
		.then((data) => {
			const resObj = {
				msg: 'Data berhasil dimasukkan',
				data: {id: data.insertId, ...insertBody}
			}
			res.json(resObj);
		}).catch((e) => {
			form.error(res, e)
		})
	},
	updateProduct: (req, res) => {
		const {params: {id}, body} = req
		const insertBody = {
			...body,
			updated_at: new Date(Date.now()),
		}
		productModel
		.updateProduct(id, insertBody)
		.then(() => {
			const resObj = {
				msg: 'Data berhasil diupdte',
				data: insertBody
			}
			res.json(resObj);
		}).catch((e) => {
			form.error(res, e)
		})
	},
	deleteProduct: (req, res) => {
		const {id} = req.params	

		productModel
		.deleteProduct(id)
		.then(() => {
			const resObj = {
				msg: 'Data berhasil dihapus',
			}
			res.json(resObj);
		}).catch((e) => {
			form.error(res, e)
		})
	}
}
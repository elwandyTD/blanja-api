const productModel = require('../models/product')
const productsModel = require('../models/products')
const form = require('../helpers/form')

module.exports = {
	getAllProduct: (req, res) => {
		productModel
		.getAllProduct(req.query)
		.then((data) => {
			res.send(data)
		})
		.catch((err) => {
			form.error(res, err)
		})
	},
	getProductById: (req, res) => {
		const {id} = req.params	

		productModel
		.getProductById(id)
		.then((product) => {
			productsModel.updatePropertyProduct(product)
			.then((product) => {
				form.success(res, product, 'ambil')
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
	insertProductAttr: async (req, res) => {
		const {params: {id, attr}, body} = req
		const insertBody = {
			product_id: id,
			...body
		}
	
		try {
			let insert
			if (attr == 'color') {
				insert = await productModel.insertAttrProduct(insertBody, 'product_colors')
			} else if (attr == 'size') {
				insert = await productModel.insertAttrProduct(insertBody, 'product_sizes')
			} else if (attr == 'image') {
				insert = await productModel.insertAttrProduct(insertBody, 'product_images')
			} else {
				res.json({
					msg: 'Attribut tidak ditemukan'
				})
			}

			const resObj = {
				msg: 'Data berhasil dimasukkan',
				data: {id: insert.insertId, ...body}
			}
			res.json(resObj);
		} catch(e) {
			form.error(res, e)
		}
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
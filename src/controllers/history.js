const historyModel = require('../models/history')
const productModel = require('../models/product')
const form = require('../helpers/form')

module.exports = {
	getAllHistory: (_, res) => {
		historyModel.getAllHistory()
		.then((histories) => {
			form.success(res, histories, 'ambil')
		}).catch((e) => {
			form.error(res, e)
		})
	},
	getHistoryById: (req, res) => {
		const {id} = req.params	

		historyModel
		.getHistoryById(id)
		.then((history) => {
			form.success(res, history)
		}).catch((e) => {
			form.error(res, e)
		})
	},
	insertHistory: async (req, res) => {
		const {body} = req
		
		const productPrice = await productModel.getProductById(body.product_id).then((data) => data[0].product_price).catch((e) => e)
		
		const insertBody = {
			...body,
			history_subtotal: parseInt(body.product_qty) * productPrice,
			history_code: Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15),
			created_at: new Date(Date.now()),
		}
		
		historyModel
		.insertHistory(insertBody)
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
}
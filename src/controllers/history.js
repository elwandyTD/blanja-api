const historyModel = require('../models/history')
const cartModel = require('../models/cart')
const form = require('../helpers/form')

module.exports = {
	getAllHistory: (_, res) => {
		historyModel.getAllHistory()
		.then( async (histories) => {
			const detailHistories = await historyModel.updateHistoryAttribute(histories)

			form.success(res, detailHistories, 'ambil')
		}).catch((e) => {
			form.error(res, e)
		})
	},
	getHistoryById: (req, res) => {
		const {id} = req.params	

		historyModel
		.getHistoryById(id)
		.then( async (history) => {
			const detailHistories = await historyModel.updateHistoryAttribute(history)

			form.success(res, detailHistories, 'ambil')
		}).catch((e) => {
			form.error(res, e)
		})
	},
	insertHistory: async (req, res) => {
		const {body} = req
		
		const totalProduct = await cartModel.getTotalCartByUserId(body.user_id).then((total) => total[0].product_total).catch((e) => res.json(e))
		const insertBody = {
			...body,
			history_subtotal: totalProduct,
			history_code: Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15),
			created_at: new Date(Date.now()),
		}
		
		historyModel
		.insertHistory(insertBody)
		.then((data) => {
			const id = data.insertId
			
			historyModel
			.insertSelectProductUser(parseInt(body.user_id), id)
			.then(() => {
				const resObj = {
					msg: 'Data berhasil dimasukkan',
					data: {id: data.insertId, ...insertBody}
				}
				res.json(resObj);
			}).catch((e) => {
				form.error(res, e)
			})
		}).catch((e) => {
			form.error(res, e)
		})
	},
}
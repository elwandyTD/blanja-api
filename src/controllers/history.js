const historyModel = require('../models/history')
const form = require('../helpers/form')

module.exports = {
	getAllHistory: (_, res) => {
		historyModel.getAllHistory()
		.then((histories) => {
			form.success(res, histories)
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
	insertHistory: (req, res) => {
		const {body} = req
		const insertBody = {
			...body,
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
const db = require('../configs/mySQL')
const qs = require('../helpers/query')

const getDetailByHistoryId = (id) => {
	return new Promise((resolve, reject) => {
		db.query(qs.queryGet('detail_histories', '*',`WHERE history_id=${id}`), (err, data) => {
			if(!err) {
				resolve(data)
			} else {
				reject(err)
			}
		})
	})
}

module.exports = {
	getAllHistory: () => {
		return new Promise((resolve, reject) => {
			db.query(qs.queryGet('histories', '*'), (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	},
	updateHistoryAttribute: async(data) => {
		try {
			for (let i = 0; i < data.length; i++) {
				const detailItems = await getDetailByHistoryId(data[i].history_id)

				data[i].products = detailItems
			}
			return data
		} catch(e) {
			return e
		}
	},
	getHistoryById: (id) => {
		return new Promise((resolve, reject) => {
			db.query(qs.queryGet('histories', '*',`WHERE history_id=${id}`), (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	},
	insertHistory: (body) => {
		return new Promise((resolve, reject) => {
			const queryS = 'INSERT INTO histories SET ?'
			db.query(queryS, body, (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	},
	insertSelectProductUser: (user_id, history_id) => {
		return new Promise((resolve, reject) => {
			const queryS = `INSERT INTO detail_histories(history_id, product_id, product_color_id, product_size_id, product_qty, product_subtotal) SELECT ${history_id},product_id,product_color_id,product_size_id,product_qty,product_subtotal FROM cart WHERE user_id=${user_id}`
			db.query(queryS, (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	}
}
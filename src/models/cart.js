const db = require('../configs/mySQL')
const qs = require('../helpers/query')

const queryS = 'SELECT * FROM categories '

module.exports = {
	getCartByUserId: (id) => {
		return new Promise((resolve, reject) => {
			db.query(qs.queryGet('cart', '*', `WHERE user_id=${id}`), (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	},
	insertToCart: (body) => {
		return new Promise((resolve, reject) => {
			db.query(qs.queryInsert('cart'), body, (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	},
	deleteProductCartById: (id) => {
		return new Promise((resolve, reject) => {
			db.query(qs.queryDelete('cart', `id=${id}`), (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	}
}
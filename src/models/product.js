const db = require('../configs/mySQL')
const qs = require('../helpers/query')

module.exports = {
	getProductAttributeByQuery: (qs) => {
		return new Promise((resolve, reject) => {
			db.query(qs, (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	},
	getProductById: (id) => {
		return new Promise((resolve, reject) => {
			const queryS = qs.queryProduct + `WHERE product_id=${id}`
			db.query(queryS, (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	},
	insertProduct: (body) => {
		return new Promise((resolve, reject) => {
			const queryS = `INSERT INTO products SET ?`
			db.query(queryS, body, (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	},
	updateProduct: (id, body) => {
		return new Promise((resolve, reject) => {
			const queryS = `UPDATE products SET ? WHERE product_id=${id}`
			db.query(queryS, body, (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	},
	deleteProduct: (id) => {
		return new Promise((resolve, reject) => {
			const queryS = `DELETE FROM products WHERE product_id=${id}`
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
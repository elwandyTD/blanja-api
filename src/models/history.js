const db = require('../configs/mySQL')
const qs = require('../helpers/query')

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
}
const db = require('../configs/mySQL')

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
	}
}
const db = require('../configs/mySQL')

module.exports = {
	getDataByTable: (table) => {
        return new Promise((resolve, reject) => {
			db.query(`SELECT * FROM ${table}`, (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
    }
}
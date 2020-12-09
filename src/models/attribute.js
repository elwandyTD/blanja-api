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
	},
	insertUploadImages: (images) => {
		return new Promise((resolve, reject) => {
			db.query(`INSERT INTO product_images (product_id, image_path) VALUES ?`, [images], (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	}
}
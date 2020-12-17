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
			// for (let i = 0; i < images.length; i++) {
				db.query(`INSERT INTO product_images (product_id, image_path) VALUES ?`, [images], (err, data) => {
				// db.query(`INSERT INTO product_images VALUES (,${Number(images[i][0])}, ${images[i][1]}) ?`, (err, data) => {
					if (err) {
						reject(err)
					}
				})
			// }
			resolve(true)
		})
	},
	
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
}
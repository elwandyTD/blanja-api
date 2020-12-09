const db = require('../configs/mySQL')
const qs = require('../helpers/query')
const concat = require('../helpers/concat')

module.exports = {
	getAllProduct: (query) => {
		return new Promise((resolve, reject) => {
			const { search, category, brand, size, color, order, sort } = query
			const limit = Number(query.limit) || 15
			const page = Number(query.page) || 1
			const offset = (page - 1) * limit || 0
			let selectedTable = ''
			let where = 'WHERE '
			let joins = ''
			const ordering = order || 'newest'
			let sorting = sort && sort.toUpperCase() || 'ASC'

			if (search) {
				if (category) {
					where += `p.product_title LIKE '%${search}%' AND `
				} else {
					where += `(p.product_title LIKE '%${search}%' OR c.category_name LIKE '%${search}%') AND `
				}
			}

			if (category) {
				where += concat.concatManyWhere(category, 'c.category_link')
			}
			if (brand) {
				where += concat.concatOneWhere(brand, 'b.brand_name')
			}
			if (size) {
				joins += ` JOIN product_sizes AS ps ON ps.product_id = p.product_id `
				where += concat.concatManyWhere(size, 'ps.size_code')
			}
			if (color) {
				joins += ` JOIN product_colors AS pc ON pc.product_id = p.product_id `
				where += concat.concatOneWhere('#' + color.toUpperCase(), 'pc.color_code')
			}

			if (where !== '') {
				let p = where.split('AND')
				p.splice(p.length - 1, 1)
				where = p.join('AND ')
			}

			if (ordering == 'name') {
				selectedTable = 'p.product_title'
			} else if (ordering == 'newest') {
				selectedTable = 'p.created_at'
			} else if (ordering == 'price') {
				selectedTable = 'p.product_price'
			} else if (ordering == 'popular') {
				selectedTable = 'product_rating'
			} else {
				selectedTable = 'p.created_at'
			}

			if (sorting !== 'DESC' && sorting !== 'ASC') {
				sorting = 'ASC'
			}

			db.query(qs.queryCount(joins, where, `ORDER BY ${selectedTable} ${sorting}`), (err, total) => {
				if(err) {
					reject(err)
				} 
				db.query(qs.queryProduct(joins, where, `ORDER BY ${selectedTable} ${sorting} LIMIT ${limit} OFFSET ${offset}`), (err, data) => {
					if(!err) {
						resolve({
							totalProducts: total.length,
							products: data
						})
					} else {
						reject(err)
					}
				})
			})
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
	getProductById: (id) => {
		return new Promise((resolve, reject) => {
			const queryS = qs.queryProduct() + `WHERE product_id=${id}`
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
	},
	insertAttrProduct: (body, table) => {
		return new Promise((resolve, reject) => {
			const queryS = `INSERT INTO ${table} SET ?`
			db.query(queryS, body, (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	},
	getProductImageById: (imageId, productId) => {
		return new Promise((resolve, reject) => {
			const queryS = `SELECT * FROM product_images WHERE product_image_id=${imageId} AND product_id=${productId}`
			db.query(queryS, (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	},
	deleteProductImageById: (imageId, productId) => {
		return new Promise((resolve, reject) => {
			// const queryS = `DELETE FROM product_images WHERE product_image_id=${imageId}`
			db.query(qs.queryDelete('product_images', `product_image_id=${imageId} AND product_id=${productId}`), (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	},
}
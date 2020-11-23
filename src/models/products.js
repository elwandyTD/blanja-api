const db = require('../configs/mySQL')
const qs = require('../helpers/query')

const productModel = require('../models/product')

const getProductAttribute = productModel.getProductAttributeByQuery
const query = qs.getQueryWhere

module.exports = {
	getAllProducts: (query) => {
		return new Promise((resolve, reject) => {
			const {q, order, sort} = query
			let where = ''
			
			if (typeof q !== 'undefined') {
				where += `WHERE p.product_title LIKE '%${q}%' OR c.category_name LIKE '%${q}%' `
			} 
			
			if (typeof order !== 'undefined' && typeof sort !== 'undefined') {
				let selectedTable = ''
				if (order.toLowerCase() == 'name') {
					selectedTable += 'product_title'
				} else if (order.toLowerCase() == 'newest') {
					selectedTable += 'created_at'
				} else if (order.toLowerCase() == 'price') {
					selectedTable += 'product_price'
				} 
				where += `ORDER BY ${selectedTable} ${sort.toUpperCase()}`
			} 

			const queryS = qs.queryProduct + where
			db.query(queryS, (err, data) => {
				if(!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	},
	updatePropertyProduct: async (data) => {
		try {
			for (let i = 0; i < data.length; i++) {
				const productColor = await getProductAttribute(query('product_colors', 'product_color_name', 'product_id', data[i].product_id))
				const productSize = await getProductAttribute(query('product_sizes', 'product_size_name', 'product_id', data[i].product_id))
				const productImage = await getProductAttribute(query('product_images', 'product_image_name', 'product_id', data[i].product_id))

				data[i].product_colors = productColor
				data[i].product_sizes = productSize
				data[i].product_images = productImage
			}
			return data

		} catch (e) {
			return e
		}
	}

}
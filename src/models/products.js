const db = require('../configs/mySQL')
const qs = require('../helpers/query')

const productModel = require('../models/product')

const getProductAttribute = productModel.getProductAttributeByQuery
const query = qs.getQueryWhere

module.exports = {
	getAllProducts: new Promise((resolve, reject) => {
		const qs = "SELECT p.product_id, p.product_title, b.brand_name, c.category_name, p.product_price, p.product_qty, p.product_condition, p.product_description, p.created_at, p.updated_at FROM products AS p JOIN categories AS c ON c.category_id = p.category_id JOIN brands AS b ON b.brand_id = p.brand_id"
		db.query(qs, (err, data) => {
			if(!err) {
				resolve(data)
			} else {
				reject(err)
			}
		})
	}),
	updateAllProducts: async (data) => {
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
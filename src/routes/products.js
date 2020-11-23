const express = require('express')
const productsRouter = express.Router()
const db = require('../configs/mySQL')


// const qs = `SELECT product_color_name FROM product_colors WHERE product_color_id=${id}`
const simpleQueryWhere = (table, column_needed, column_where, value_where) => `SELECT ${column_needed} FROM ${table} WHERE ${column_where}=${value_where}`

const getProductColorsById = (id) => {
	return new Promise((resolve, reject) => {
		const qs = simpleQueryWhere('product_colors', 'product_color_name', 'product_id', id)
		db.query(qs, (err, data) => {
			if(!err) {
				resolve(data)
			} else {
				reject(err)
			}
		})
	})
}

const getProductSizesById = (id) => {
	return new Promise((resolve, reject) => {
		const qs = simpleQueryWhere('product_sizes', 'product_size_name', 'product_id', id)
		db.query(qs, (err, data) => {
			if(!err) {
				resolve(data)
			} else {
				reject(err)
			}
		})
	})
}

const getProductImagesById = (id) => {
	return new Promise((resolve, reject) => {
		const qs = simpleQueryWhere('product_images', 'product_image_name', 'product_id', id)
		db.query(qs, (err, data) => {
			if(!err) {
				resolve(data)
			} else {
				reject(err)
			}
		})
	})
}

productsRouter.get('/', (_, res) => {
  const getAllProducts = new Promise((resolve, reject) => {
		// const qs = "SELECT * FROM products"
		const qs = "SELECT p.product_id, p.product_title, b.brand_name, c.category_name, p.product_price, p.product_qty, p.product_condition, p.product_description, p.created_at, p.updated_at FROM products AS p JOIN categories AS c ON c.category_id = p.category_id JOIN brands AS b ON b.brand_id = p.brand_id"
		db.query(qs, (err, data) => {
			if(!err) {
				resolve(data)
			} else {
				reject(err)
			}
		})
	})

	getAllProducts
	.then(async (data) => {
		for (let i = 0; i < data.length; i++) {
			const productColor = await getProductColorsById(data[i].product_id)
			const productSize = await getProductSizesById(data[i].product_id)
			const productImage = await getProductImagesById(data[i].product_id)

			data[i].product_colors = productColor
			data[i].product_sizes = productSize
			data[i].product_images = productImage
		}
		res.json(data)
	})
	.catch((err) => {
		res.json(err)
	})
})

// productsRouter.get('/name', (_, res) => {

// })

module.exports = productsRouter
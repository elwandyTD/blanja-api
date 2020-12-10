const productModel = require('../models/product')
const productsModel = require('../models/products')
const attrModel = require('../models/attribute')
const form = require('../helpers/form')
const fs = require('fs')
const product = require('../models/product')
const { json } = require('express')

module.exports = {
	getAllProduct: (req, res) => {
		productModel
		.getAllProduct(req.query && req.query)
		.then((data) => {
			const { page, limit } = req.query
			const url = req.originalUrl.split('?')[1] || ''
			const removeQueryPage = page && url.split('page=' + page)[1] || url
			const removeQueryLimit = limit && removeQueryPage.split('limit=' + limit).join('') || removeQueryPage
			const removeFirst = removeQueryLimit[0] == '&' ? removeQueryLimit.slice(1, removeQueryLimit.length ) : removeQueryLimit
			const removeLast = removeFirst[removeFirst.length - 1] == '&' ? removeFirst.slice(0, removeFirst.length - 1) : removeFirst
			const removeLimit = removeLast.includes('limit=' + limit) ? removeLast.split('limit=' + limit).join('') : removeLast
			const removePage = removeLast.includes('page=' + page) ? removeLimit.split('page=' + page).join('') : removeLimit
			const currentPage = Number(page || 1)
			let limiter = limit || 15

			const totalPage = (Math.ceil(data.totalProducts / limiter))
			const nextPage = `/product?page=${ (Number(page) || 1) + 1 }${ limit ? '&limit=' + limiter  : '' }${ '&' + removePage }`
			const prevPage = `/product?page=${ (Number(page) || 1) - 1 }${ limit ? '&limit=' + limiter  : '' }${ '&' + removePage }`
			form.success(res, {
				products: data.products,
				pageInfo: {
					currentPage,
					nextPage: (currentPage == totalPage) ? null : nextPage,
					prevPage: (currentPage == 1) ? null : prevPage,
					totalPage,
				}
			}, 'ambil')
		})
		.catch((err) => {
			console.log(err)
			form.error(res, err)
		})
	},
	getProductById: (req, res) => {
		const {id} = req.params	

		productModel
		.getProductById(id)
		.then((product) => {
			productsModel.updatePropertyProduct(product)
			.then((product) => {
				form.success(res, product, 'ambil')
			}).catch((e) => {
				form.error(res, e)
			})
		}).catch((e) => {
			form.error(res, e)
		})
	},
	insertProduct: (req, res) => {
		const { body } = req
		const insertBody = {
			...body,
			created_at: new Date(Date.now()),
			updated_at: new Date(Date.now()),
		}

		if (!req.files[0]) {
			form.error(res, {
				msg: "Silahkan masukkan gambar",
			})
		}
		
		productModel
		.insertProduct(insertBody)
		.then((data) => {
			const imagesArr = req.files.map((i) => {
				const filepath = 'public/example/' + i.filename
				return [data.insertId, filepath]
			})
			// res.json(imagesArr)
			attrModel
			.insertUploadImages(imagesArr)
			.then(() => {
				const resObj = {
					msg: 'Data berhasil dimasukkan',
					data: {id: data.insertId, ...insertBody, images: imagesArr}
				}
				res.json(resObj);
			})
			.catch((err) => {
				form.error(res, err)
			})
			// res.send(imagesArr)
		}).catch((e) => {
			form.error(res, e)
		})
	},
	insertProductAttr: async (req, res) => {
		const {params: {id, attr}, body} = req
		const insertBody = {
			product_id: id,
			...body
		}
	
		try {
			let insert
			if (attr == 'color') {
				insert = await productModel.insertAttrProduct(insertBody, 'product_colors')
			} else if (attr == 'size') {
				insert = await productModel.insertAttrProduct(insertBody, 'product_sizes')
			} else if (attr == 'image') {
				insert = await productModel.insertAttrProduct(insertBody, 'product_images')
			} else {
				res.json({
					msg: 'Attribut tidak ditemukan'
				})
			}

			const resObj = {
				msg: 'Data berhasil dimasukkan',
				data: {id: insert.insertId, ...body}
			}
			res.json(resObj);
		} catch(e) {
			form.error(res, e)
		}
	},
	updateProduct: (req, res) => {
		const {params: {id}, body} = req
		const insertBody = {
			...body,
			updated_at: new Date(Date.now()),
		}
		productModel
		.updateProduct(id, insertBody)
		.then(() => {
			const resObj = {
				msg: 'Data berhasil diupdte',
				data: insertBody
			}
			res.json(resObj);
		}).catch((e) => {
			form.error(res, e)
		})
	},
	deleteProduct: (req, res) => {
		const {id} = req.params	

		productModel
		.deleteProduct(id)
		.then(() => {
			const resObj = {
				msg: 'Data berhasil dihapus',
			}
			res.json(resObj);
		}).catch((e) => {
			form.error(res, e)
		})
	},
	deleteProductImage: (req, res) => {
		const { imageId, productId } = req.params

		productModel
		.getProductImageById(imageId, productId)
		.then((data) => {
			productModel
			.deleteProductImageById(imageId, productId)
			.then(() => {
				fs.unlink('./' + data[0].image_path, (err) => {
					form.error(res, err)	
				})
				// res.setHeader("Content-Type", "text/html");
				res.status(200).json({
					message: 'data berhasil dihapus'
				})
				// return res.end();
			})
			.catch((err) => {
				form.error(res, err)
			})
		})
		.catch((err) => {
			form.error(res, err)
		})
	}
}
const form = require('../helpers/form')
const authModel = require('../models/auth')

module.exports = {
	registerUser: (req, res) => {
		const { params: {route}, body } = req
		const availableTables = ['customer', 'seller']
		const insertBody = {
			...body,
			created_at: new Date(Date.now()),
			updated_at: new Date(Date.now()),
		}	

		if (availableTables.includes(route)) {
			const table = route + 's'

			authModel.addNewUser(insertBody, table)
			.then((data) => {
				form.success(res, data, 'tambah')
				res.json({
					status: 200,
					message: 'User berhasil ditambahkan'
				})
			})
			.catch((err) => {
				form.error(res, err)
			})
		} else {
			form.error(res, 'rute tidak ditemukan')
		}
	},
	loginUser: (req, res) => {
		const { params: { route }, body } = req
		const availableTables = ['customer', 'seller']	

		if (availableTables.includes(route)) {
			const table = route + 's'

			authModel
			.checkUserLogin(body, table)
			.then((data) => {
				form.success(res, data, 'ambil')
			})
			.catch((err) => {
				form.error(res, err)
			})
		} else {
			form.error(res, 'rute tidak ditemukan')
		}
	}
}
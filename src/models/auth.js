const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const query = require('../helpers/query')
const db = require('../configs/mySQL')

module.exports = {
	addNewUser: (body, table) => {
		return new Promise((resolve, reject) => {
			db.query(query.queryGet(table, '*', `WHERE user_email='${body.user_email}'`), (err, data) => {
				if (err) {
					reject(err)
				} 
				if (data.length) {
					reject('email sudah terdaftar')
				}
				const saltRounds = 10
				bcrypt.genSalt(saltRounds, (err, salt) => {
					if (err) {
						reject(err)
					}
					bcrypt.hash(body.user_password, salt, (err, hashedPassword) => {
						if (err) {
							reject(err)
						}
						const newBody = {
							...body,
							user_password: hashedPassword
						}
						db.query(query.queryInsert(table), newBody, (err, data) => {
							if (!err) {
								resolve(data)
							} else {
								reject(err)
							}
						})
					})
				})
			})
		})
	}
}
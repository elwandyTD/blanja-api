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
					return reject('email sudah terdaftar')
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
	},
	checkUserLogin: (body, table) => {
		return new Promise((resolve, reject) => {
			const { user_email, user_password } = body
			db.query(query.queryGet(table, 'user_password, user_name ', `WHERE user_email='${user_email}'`), (err, data) => {
				if (err) {
					reject(err)
				}
				// return resolve(data)
				if (!data.length) {
					return reject('user tidak ditemukan')
				}
				bcrypt.compare(user_password, data[0].user_password, (err, result) => {
					if (err) {
						return reject(err)
					}
					if (!result) {
						return reject('password salah')
					} else {
						const level = table.slice(0, table.length - 1)
						const payload = {
							user_name: data[0].user_name,
							user_email,
							level,
						}
						const secret = process.env.SECRET_KEY;
						const token = jwt.sign(payload, secret, {
							expiresIn: "10h"
						});
						resolve({ 
							token,
							user_email,
							level
						});
					}
				})
			})
		})
	},
	getToken: (token) => {
		return new Promise((resolve, reject) => {
			db.query(query.queryGet('token_whitelist', '*', `WHERE token='${token}'`), (err, data) => {
				if (!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	},
	insertToken: (token) => {
		return new Promise((resolve, reject) => {
			db.query(query.queryInsert('token_whitelist'), token, (err, data) => {
				if (!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	},
	deleteToken: (token) => {
		return new Promise((resolve, reject) => {
			db.query(query.queryDelete('token_whitelist', `token='${token}'`), (err, data) => {
				if (!err) {
					resolve(data)
				} else {
					reject(err)
				}
			})
		})
	}
}
const jwt = require('jsonwebtoken')
const authModel = require('../../models/auth')

module.exports = {
	isValid: (req, res, next) => {
		const bearerToken = req.header("x-access-token")		
		if (!bearerToken) {
			return res.status(401).json({
				message: 'Silahkan login dahulu'
			})
		} else {
			const token = bearerToken.split(" ")[1]
			authModel
			.getToken(token)
			.then((isToken) => {
				if (!isToken.length) {
					return res.status(401).json({
						message: 'Token tidak teridentifikasi',
					})
				} else {
					try {
						const decodedToken = jwt.verify(token, process.env.SECRET_KEY)
						req.decodedToken = decodedToken
						return next()
					} catch (err) {
						return res.status(401).json({
							message: 'Token tidak teridentifikasi',
							error: err
						})
					}
				}
			})
			.catch((err) => {
				return res.status(401).json({
					message: 'Token tidak teridentifikasi',
					error: err
				})
			})
		}
	},
	isSeller: (req, res, next) => {
		const { decodedToken } = req
		if (!decodedToken) {
			return res.status(401).json({
				message: 'Silahkan login dahulu'
			})
		} else {
			if (decodedToken.level !== "seller") {
				return res.status(401).json({
					message: 'Role anda tidak memadai'
				})
			} 
			return next()
		}
	},
	isCustomer: (req, res, next) => {
		const { decodedToken } = req
		if (!decodedToken) {
			return res.status(401).json({
				message: 'Silahkan login dahulu'
			})
		} else {
			if (decodedToken.level !== "customer") {
				return res.status(401).json({
					message: 'Role anda tidak memadai'
				})
			} 
			return next()
		}
	},
	
}
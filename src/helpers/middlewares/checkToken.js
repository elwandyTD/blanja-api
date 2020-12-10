const jwt = require('jsonwebtoken')

module.exports = {
	isValid: (req, res, next) => {
		const bearerToken = req.header("x-access-token")		
		if (!bearerToken) {
			return res.status(401).json({
				message: 'Silahkan login dahulu'
			})
		} else {
			const token = bearerToken.split(" ")[1]
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
	}
}
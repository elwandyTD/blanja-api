const express = require('express')
const authRouter = express.Router()

const authController = require('../controllers/auth')

authRouter.post('/register/:route', authController.registerUser)
authRouter.post('/login/:route', authController.loginUser)
// authRouter.post('/logout', authController)

module.exports = authRouter
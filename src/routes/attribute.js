const express = require('express')
const attrRouter = express.Router()

const attrController = require('../controllers/attribute')

attrRouter.get('/:attr', attrController.getDataByAttr)

module.exports = attrRouter
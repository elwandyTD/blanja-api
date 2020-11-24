const express = require('express')
const historyRouter = express.Router()

const historyController = require('../controllers/history')

historyRouter.get('/', historyController.getAllHistory)
historyRouter.get('/:id', historyController.getHistoryById)
historyRouter.post('/', historyController.insertHistory)

module.exports = historyRouter
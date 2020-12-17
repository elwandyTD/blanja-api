const AttrModel = require('../models/attribute')
const form = require('../helpers/form')

module.exports = {
	errorRoute: (_, res) => {
		res.json({
			message: 'Silahkan input id user'
		})
	},
    getDataByAttr: (req, res) => {
        let table
        const { attr } = req.params

        if (attr == 'colors') table = 'colors'
        else if (attr == 'brands') table = 'brands'
		else if (attr == 'condition') table = 'conditions'
		else if (attr == 'sizes') table = 'sizes'
        
				AttrModel
				.getDataByTable(table)
				.then((data) => {
					form.success(res, data, 'ambil')
				})
				.catch((e) => {
					form.error(res, e)
				})
    }
}
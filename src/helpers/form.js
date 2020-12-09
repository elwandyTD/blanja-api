module.exports = {
	success: (res, data, msg) => {
		const resObj = {
			status: 200,
			message: `Data berhasil di${msg}`,
			data: data.length == 0 ? 'Data kosong silahkan input baru' : data,
		}
		res.status(200).json(resObj)
	},
	errorUndefined: (res) => {
		res.status(500).json({
			message: `Data tidak ditemukan`,
		})
	},
	error: (res, err) => {
		res.status(500).json({
			message: 'Error ditemukan',
			error: err
		})
	},
	errorNotFound: (res, data) => {
		if (data.length == 0) {
			res.json({
				status: 200,
				message: 'Data tidak ditemukan'
			})
		}
		return data
	}

}
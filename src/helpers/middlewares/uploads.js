const multer = require('multer')
const path = require("path");

const form = require("../form");

const multerStorage = multer.diskStorage({
  destination: function (req, file, callback) {
    callback(null, "./public/example");
  },
  filename: function (req, file, callback) {
		const fieldname = file.fieldname.replace('[]', '')
    const formatName = `${Date.now()}-${fieldname}${path.extname(
      file.originalname
    )}`
    callback(null, formatName)
  },
});

const upload = multer({
  storage: multerStorage,
  // limits: 2 * 1000 * 1000, // 2 MB
})

const uploadImages = (req, res, next) => {
	const imagesUpload = upload.array("upload_images[]", 5)
	imagesUpload(req, res, (err) => {
		if (err) {
      form.error(res, {
        msg: "Multer Error",
        err,
      })
    } else {
      next()
    }
	})
}

module.exports = uploadImages
const profileModel = require("../models/profile");
const form = require("../helpers/form");

module.exports = {
  updatePhoto: (req, res) => {
    res.send(req.file);
  },
  getUserAndAddress: (req, res) => {
    const {
      params: { id, id_address },
    } = req;

    profileModel
      .getActiveAddress(id, id_address)
      .then((data) => {
        form.success(res, data, "ambil");
      })
      .catch((e) => {
        form.error(res, e);
      });
  },
  addReview: (req, res) => {
    const { body } = req;

    profileModel
      .insertReview(body)
      .then(() => {
        form.success(res, "success insert", "tambah");
      })
      .catch((e) => {
        form.error(res, e);
      });
  },
  changeUsername: (req, res) => {
    const { body } = req;
  },
};

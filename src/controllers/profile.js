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

    // if (availableTables.includes(route)) {
    //   const table = route;

    // } else {
    //   form.error(res, "rute tidak ditemukan");
    // }
  },
};

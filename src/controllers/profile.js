const profileModel = require("../models/profile");
const form = require("../helpers/form");

module.exports = {
  updatePhoto: (req, res) => {
    res.send(req.file);
  },
};

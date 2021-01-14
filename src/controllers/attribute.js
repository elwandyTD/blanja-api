const AttrModel = require("../models/attribute");
const form = require("../helpers/form");

module.exports = {
  errorRoute: (_, res) => {
    res.json({
      message: "Silahkan input id user",
    });
  },
  getDataByAttr: (req, res) => {
    let table;
    const { attr } = req.params;

    if (attr == "colors") table = "colors";
    else if (attr == "brands") table = "brands";
    else if (attr == "condition") table = "conditions";
    else if (attr == "sizes") table = "sizes";
    else if (attr == "address") table = "address";

    AttrModel.getDataByTable(table)
      .then((data) => {
        form.success(res, data, "ambil");
      })
      .catch((e) => {
        form.error(res, e);
      });
  },
  insertAddress: (req, res) => {
    const { body } = req;

    AttrModel.insertAddress(body)
      .then((data) => {
        const id = data.insertId;
        AttrModel.updateUserAddress(body.user_id, id)
          .then((update) => {
            form.success(res, update, "ambil");
          })
          .catch((e) => {
            form.error(res, e);
          });
      })
      .catch((e) => {
        form.error(res, e);
      });
  },
  updateAddress: (req, res) => {
    const {
      body,
      params: { id },
    } = req;

    AttrModel.updateAddress(id, body)
      .then((data) => {
        form.success(res, data, "ambil");
      })
      .catch((e) => {
        form.error(res, e);
      });
  },
};

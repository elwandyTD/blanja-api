const db = require("../configs/mySQL");
const qs = require("../helpers/query");

const queryS = "SELECT * FROM categories ";

module.exports = {
  updatePhoto: (file, id) => {},
  getAddress: (id, idAddress) => {
    return new Promise((resolve, reject) => {
      db.query(
        qs.queryGet("address", "*", `WHERE user_id=${id} AND id=${idAddress}`),
        (err, data) => {
          if (!err) {
            resolve(data[0]);
          } else {
            reject(err);
          }
        }
      );
    });
  },
};

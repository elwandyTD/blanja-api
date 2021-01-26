const db = require("../configs/mySQL");
const qs = require("../helpers/query");

module.exports = {
  // updatePhoto: (file, id) => {},
  getActiveAddress: (id, idAddress) => {
    return new Promise((resolve, reject) => {
      const q = `SELECT * FROM customers AS c JOIN address AS a ON a.user_id = c.user_id WHERE a.user_id =${id} AND a.id = ${idAddress}`;
      db.query(q, (err, data) => {
        if (!err) {
          resolve(data[0]);
        } else {
          reject(err);
        }
      });
    });
  },
};

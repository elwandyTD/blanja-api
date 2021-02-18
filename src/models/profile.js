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
  insertReview: (body) => {
    return new Promise((resolve, reject) => {
      const q = "INSERT INTO reviews SET ?";
      db.query(q, body, (err, data) => {
        if (!err) {
          resolve(data);
        } else {
          reject(err);
        }
      });
    });
  },
  updateUsername: (table, name, id) => {
    return new Promise((resolve, reject) => {
      const q = `UPDATE ${table} SET user_name='${name}' WHERE user_id='${id}'`;
      db.query(q, (err, data) => {
        if (!err) {
          resolve(data);
        } else {
          reject(err);
        }
      });
    });
  },
};

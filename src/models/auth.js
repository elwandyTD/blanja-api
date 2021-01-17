const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const query = require("../helpers/query");
const db = require("../configs/mySQL");

module.exports = {
  getUserByEmail: (table, email) => {
    return new Promise((resolve, reject) => {
      db.query(
        query.queryGet(
          table,
          "user_id, user_email",
          `WHERE user_email='${email}'`
        ),
        (err, data) => {
          if (err) {
            reject(err);
          }
          if (!data.length) {
            return reject("Email is not match in our record");
          } else {
            return resolve({ ...data[0], role: table });
          }
        }
      );
    });
  },
  addNewUser: (body, table) => {
    return new Promise((resolve, reject) => {
      db.query(
        query.queryGet(table, "*", `WHERE user_email='${body.user_email}'`),
        (err, data) => {
          if (err) {
            reject(err);
          }
          if (data.length) {
            return reject("email has been registered");
          }
          const saltRounds = 10;
          bcrypt.genSalt(saltRounds, (err, salt) => {
            if (err) {
              reject(err);
            }
            bcrypt.hash(body.user_password, salt, (err, hashedPassword) => {
              if (err) {
                reject(err);
              }
              const newBody = {
                ...body,
                user_password: hashedPassword,
              };
              db.query(query.queryInsert(table), newBody, (err, data) => {
                if (!err) {
                  resolve(data);
                } else {
                  reject(err);
                }
              });
            });
          });
        }
      );
    });
  },
  resetPassword: (body) => {
    return new Promise((resolve, reject) => {
      const { user_email, role, user_password } = body;

      const saltRounds = 10;
      bcrypt.genSalt(saltRounds, (err, salt) => {
        if (err) {
          reject(err);
        }
        bcrypt.hash(user_password, salt, (err, hashedPassword) => {
          if (err) {
            reject(err);
          }
          const newBody = {
            user_password: hashedPassword,
          };
          db.query(
            query.queryUpdate(role, `WHERE user_email='${user_email}'`),
            newBody,
            (err, data) => {
              if (!err) {
                resolve(data);
              } else {
                reject(err);
              }
            }
          );
          // db.query(query.queryInsert(table), newBody, (err, data) => {
          //   if (!err) {
          //     resolve(data);
          //   } else {
          //     reject(err);
          //   }
          // });
        });
      });
    });
  },
  checkUserLogin: (body, table) => {
    return new Promise((resolve, reject) => {
      const { user_email, user_password } = body;

      if (user_password == "") {
        return reject("silahkan isi password");
      }

      db.query(
        query.queryGet(
          table,
          "user_id, user_password, user_name ",
          `WHERE user_email='${user_email}'`
        ),
        (err, data) => {
          if (err) {
            reject(err);
          }
          // return resolve(data)
          if (!data.length) {
            return reject("Email or password is not match");
            // return reject("User not found !");
          }
          bcrypt.compare(
            user_password,
            data[0].user_password,
            (err, result) => {
              if (err) {
                return reject(err);
              }
              if (!result) {
                return reject("Email or password is not match");
              } else {
                const level = table.slice(0, table.length - 1);
                const user_id = data[0].user_id;
                console.log(data[0]);
                const payload = {
                  user_name: data[0].user_name,
                  user_email,
                  level,
                };
                const secret = process.env.SECRET_KEY;
                const token = jwt.sign(payload, secret, {
                  expiresIn: "10h",
                });
                resolve({
                  token,
                  user_id,
                  user_email,
                  user_name: data[0].user_name,
                  level,
                });
              }
            }
          );
        }
      );
    });
  },
  getToken: (token) => {
    return new Promise((resolve, reject) => {
      db.query(
        query.queryGet("token_whitelist", "*", `WHERE token='${token}'`),
        (err, data) => {
          if (!err) {
            resolve(data);
          } else {
            reject(err);
          }
        }
      );
    });
  },
  insertToken: (token) => {
    return new Promise((resolve, reject) => {
      db.query(query.queryInsert("token_whitelist"), token, (err, data) => {
        if (!err) {
          resolve(data);
        } else {
          reject(err);
        }
      });
    });
  },
  deleteToken: (token) => {
    return new Promise((resolve, reject) => {
      db.query(
        query.queryDelete("token_whitelist", `token='${token}'`),
        (err, data) => {
          if (!err) {
            resolve(data);
          } else {
            reject(err);
          }
        }
      );
    });
  },
  getOTP: (otp) => {
    return new Promise((resolve, reject) => {
      db.query(
        query.queryGet("otp", "*", `WHERE otp='${otp}'`),
        (err, data) => {
          if (err) {
            reject(err);
          }
          if (!data.length) {
            reject("OTP is not match in our record");
          } else {
            resolve(data[0]);
          }
        }
      );
    });
  },
  insertOTP: (body) => {
    return new Promise((resolve, reject) => {
      db.query(query.queryInsert("otp"), body, (err, data) => {
        if (!err) {
          resolve(data);
        } else {
          reject(err);
        }
      });
    });
  },
  deleteOTP: (otp) => {
    return new Promise((resolve, reject) => {
      db.query(query.queryDelete("otp", `otp='${otp}'`), (err, data) => {
        if (!err) {
          resolve(data);
        } else {
          reject(err);
        }
      });
    });
  },
};

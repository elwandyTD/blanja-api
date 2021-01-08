const form = require("../helpers/form");
const auth = require("../models/auth");
const authModel = require("../models/auth");
const nodemailer = require("nodemailer");

module.exports = {
  registerUser: (req, res) => {
    const {
      params: { route },
      body,
    } = req;
    const availableTables = ["customer", "seller"];
    const insertBody = {
      ...body,
      created_at: new Date(Date.now()),
      updated_at: new Date(Date.now()),
    };

    if (availableTables.includes(route)) {
      const table = route + "s";

      authModel
        .addNewUser(insertBody, table)
        .then(() => {
          res.json({
            status: 200,
            message: "User berhasil ditambahkan",
          });
        })
        .catch((err) => {
          form.error(res, err);
        });
    } else {
      form.error(res, "rute tidak ditemukan");
    }
  },
  loginUser: (req, res) => {
    const {
      params: { route },
      body,
    } = req;
    const availableTables = ["customer", "seller"];

    if (availableTables.includes(route)) {
      const table = route + "s";
      authModel
        .checkUserLogin(body, table)
        .then((data) => {
          authModel
            .insertToken({ token: data.token })
            .then(() => {
              form.success(res, data, "ambil");
            })
            .catch((err) => {
              return res.json({
                message: "Error",
                err,
              });
            });
        })
        .catch((err) => {
          res.json({
            err,
          });
        });
    } else {
      form.error(res, "rute tidak ditemukan");
    }
  },
  logoutUser: (req, res) => {
    // const { user_id } = req.params
    const bearerToken = req.header("x-access-token");

    if (!bearerToken) {
      return res.status(401).json({
        message: "Silahkan login dahulu",
      });
    } else {
      const token = bearerToken.split(" ")[1];

      authModel
        .deleteToken(token)
        .then(() => {
          return res.json({
            isLogout: true,
            message: "User berhasil logout",
          });
        })
        .catch((err) => {
          res.json({
            isLogout: false,
            message: "User gagal logout",
            err,
          });
        });
    }
  },
  sendEmail: (_, res) => {
    const transporter = nodemailer.createTransport({
      service: "Gmail",
      auth: {
        user: "elwanditirtana1945a@gmail.com",
        pass: "ETDldTS123",
      },
    });

    const mailOptions = {
      from: "elwanditirtana1945a@gmail.com",
      to: "medaco4758@yutongdt.com",
      subject: "Test Node Mailer",
      text: "Hai hai hai test test",
      html: "<b>Hello world?</b>",
    };

    transporter.sendMail(mailOptions, function (error, info) {
      if (error) {
        res.send(error);
      } else {
        res.send(info);
      }
    });
  },
};

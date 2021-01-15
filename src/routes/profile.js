const express = require("express");
const profileRouter = express.Router();

const profileController = require("../controllers/profile");
const uploadPhoto = require("../helpers/middlewares/uploadPhoto");

profileRouter.post("/photo", uploadPhoto, profileController.updatePhoto);

module.exports = profileRouter;

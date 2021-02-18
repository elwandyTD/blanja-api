const express = require("express");
const profileRouter = express.Router();

const profileController = require("../controllers/profile");
const uploadPhoto = require("../helpers/middlewares/uploadPhoto");

profileRouter.post("/photo", uploadPhoto, profileController.updatePhoto);
profileRouter.get(
  "/address/:id/:id_address",
  profileController.getUserAndAddress
);
profileRouter.post("/review", profileController.addReview);

module.exports = profileRouter;

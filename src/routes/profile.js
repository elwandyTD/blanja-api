const express = require("express");
const profileRouter = express.Router();

const profileController = require("../controllers/profile");
const uploadPhoto = require("../helpers/middlewares/uploadPhoto");

profileRouter.patch("/photo", uploadPhoto, profileController.updatePhoto);
profileRouter.get(
  "/address/:id/:id_address",
  profileController.getUserAndAddress
);
profileRouter.get("/review/:id", profileController.getReview);
profileRouter.post("/review", profileController.addReview);
profileRouter.patch("/username/:id", profileController.changeUsername);

module.exports = profileRouter;

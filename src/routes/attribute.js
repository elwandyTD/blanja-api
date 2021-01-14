const express = require("express");
const attrRouter = express.Router();

const attrController = require("../controllers/attribute");

attrRouter.get("/:attr", attrController.getDataByAttr);
attrRouter.post("/address", attrController.insertAddress);
attrRouter.patch("/address/:id", attrController.updateAddress);

module.exports = attrRouter;

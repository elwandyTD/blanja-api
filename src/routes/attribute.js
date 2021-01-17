const express = require("express");
const attrRouter = express.Router();

const attrController = require("../controllers/attribute");

attrRouter.get("/:attr", attrController.getDataByAttr);
attrRouter.post("/address", attrController.insertAddress);
attrRouter.get("/address/:id", attrController.getAddressByUser);
attrRouter.patch("/address/:id", attrController.updateAddress);
attrRouter.delete("/address/:id", attrController.deleteAddress);

module.exports = attrRouter;

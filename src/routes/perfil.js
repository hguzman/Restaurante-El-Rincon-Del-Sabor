const express = require("express");
const router = express.Router();
const Plato = require("../models/User");
const {isLoggedIn, isNotLoggedIn} = require('../helpers/auth');

router.get("/perfil", isLoggedIn,(req, res, next) => {
  res.render("perfil");
});

module.exports = router;

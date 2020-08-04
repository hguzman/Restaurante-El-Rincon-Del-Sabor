const express = require('express');
const router = express.Router();
const Cliente = require ("../models/Cliente");
const {isLoggedIn, isNotLoggedIn} = require('../helpers/auth');


router.get("/factura/new", (req, res, next) => {
  res.render("ventas/new");
});

router.post("/factura/new",  async (req, res, next) => {
  const {nombre} = req.body;
  const cliente = await Cliente.find({nombre: {$eq: nombre}});
  console.log(cliente);
  res.redirect("/factura/new");
});
module.exports = router;

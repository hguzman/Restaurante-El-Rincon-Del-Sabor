const express = require('express');
const router = express.Router();
const Cliente = require ("../models/Cliente");
const {isLoggedIn, isNotLoggedIn} = require('../helpers/auth');


router.get("/factura/new", isLoggedIn,(req, res, next) => {
  res.render("ventas/new");
});

router.post("/factura/new", isLoggedIn, async (req, res, next) => {
  const {nombre} = req.body;
  const cliente = await Cliente.find({nombre: {$eq: nombre}});
  console.log(cliente);
  res.render("ventas/new", {cliente});
});
module.exports = router;

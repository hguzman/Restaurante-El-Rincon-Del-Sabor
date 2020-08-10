const express = require('express');
const router = express.Router();
const Cliente = require ("../models/Cliente");
const Plato = require ("../models/Plato");
const {isLoggedIn, isNotLoggedIn} = require('../helpers/auth');


router.get("/factura/new", isLoggedIn,(req, res, next) => {
  res.render("ventas/new");
});

router.post("/factura/new", isLoggedIn, async (req, res, next) => {
  const {nombre} = req.body;
  const cliente = await Cliente.find({$and: [{nombre: {$eq: nombre}}, {estado:{$eq:"Activo"}}]});
  const producto = await Plato.find({$and: [{nombre: {$eq: nombre}}, {estado:{$eq:"Disponible"}}]});

  if(cliente.length >= 1){
    res.render("ventas/new", {cliente});
  }else if (producto.length >= 1) {
    res.render("ventas/new", {producto})
  }else{
    res.render("ventas/new");
  }



});
module.exports = router;

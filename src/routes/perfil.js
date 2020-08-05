var express = require("express");
var router = express.Router();
const Plato = require("../models/User");
const {isLoggedIn, isNotLoggedIn} = require('../helpers/auth');

router.get("/perfil/show",isLoggedIn, async (req, res, next) => {
  const perfiles = await Plato.find();
  console.log(perfiles);
  res.render("perfiles/show", { perfiles });
});
router.get("/perfil/edit/:id",isLoggedIn, async (req, res, next) => {
  const perfils = await Plato.findById(req.params.id);
  res.render("perfiles/edit", { perfils });
});
router.put("/perfil/edit/:id", isLoggedIn, async (req, res, next) => {
  const { nombre, apellido, correo, celular } = req.body;
  await Plato.findByIdAndUpdate(req.params.id, {
    nombre,
    apellido,
    correo,
    celular
  });
  req.flash("success", "informacion actualizada exitosamente.");
  res.redirect("/perfil/show");
});


module.exports = router;

var express = require("express");
var router = express.Router();
const Perfil = require("../models/User");
const {isLoggedIn, isNotLoggedIn} = require('../helpers/auth');

router.get("/perfil/show",isLoggedIn, async (req, res, next) => {
  const perfiles = await Perfil.find();
  console.log(perfiles);
  res.render("perfiles/show", { perfiles });
});
router.put("/perfil/show/:id", isLoggedIn, async (req, res, next) => {
  const { foto = req.file.filename } = req.body;
  await Perfil.findByIdAndUpdate(req.params.id, {
    foto
  });
  res.redirect("/perfil/show");
});

router.get("/perfil/edit/:id",isLoggedIn, async (req, res, next) => {
  const perfils = await Perfil.findById(req.params.id);
  res.render("perfiles/edit", { perfils });
});
router.put("/perfil/edit/:id", isLoggedIn, async (req, res, next) => {
  const { nombre, apellido, correo, celular } = req.body;
  await Perfil.findByIdAndUpdate(req.params.id, {
    nombre,
    apellido,
    correo,
    celular
  });
  res.redirect("/perfil/show");
});


module.exports = router;

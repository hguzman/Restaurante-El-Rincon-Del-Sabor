var express = require("express");
var router = express.Router();
const Plato = require("../models/Plato");

router.get("/plato/new", (req, res, next) => {
  res.render("platos/new");
});

router.post("/plato/new", async (req, res) => {
  const { nombre, precio, descripcion } = req.body;
  const errors = [];
  if (!nombre) {
    errors.push({ text: "por favor llenar el campo del nombre" });
  }
  if (!precio) {
    errors.push({ text: "por favor llenar el campo del precio" });
  }
  if (!descripcion) {
    errors.push({ text: "por favor llenar el campo del descripcion" });
  }
  if (errors.length > 0) {
    res.render("platos/new", {
      errors,
      nombre,
      precio,
      descripcion
    });
  } else {
    const newPlato = new Plato({ nombre, precio, descripcion });
    console.log(newPlato);
    await newPlato.save();
    res.redirect("/plato/show");
  }
});

router.get("/plato/show", async (req, res, next) => {
  const platos = await Plato.find();
  console.log(platos);
  res.render("platos/show", { platos });
});

router.get("/plato/edit/:id", async (req, res, next) => {
  const plato = await Plato.findById(req.params.id);
  res.render("platos/edit", { plato });
});

router.put("/plato/edit/:id", async (req, res, next) => {
  const { nombre, precio, descripcion } = req.body;
  await Plato.findByIdAndUpdate(req.params.id, {
    nombre,
    precio,
    descripcion
  });
  res.redirect("/plato/show");
});

module.exports = router;

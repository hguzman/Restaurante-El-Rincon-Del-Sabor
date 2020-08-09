var express = require("express");
var router = express.Router();
const Cliente = require ("../models/Cliente");
const {isLoggedIn, isNotLoggedIn} = require('../helpers/auth');

router.get ("/cliente/new", isLoggedIn, (req, res, next)  => {
    res.render ("clientes/new");
});

router.post("/cliente/new", isLoggedIn, async (req, res) => {
    const { nombre, apellido, telefono, cedula, direccion, correo, estado } = req.body;
    const errors = [];
    if (!nombre) {
      errors.push({ text: "Por favor llenar el campo del nombre" });
    }
    if (!apellido) {
      errors.push({ text: "Por favor llenar el campo del apellido" });
    }
    if (!telefono) {
      errors.push({ text: "Por favor llenar el campo del telefono" });
    }
    if (!cedula) {
      errors.push({ text: "Por favor llenar el campo de la cédula" });
    }
    if (!direccion){
        errors.push({text: "Por favor llenar el campo de dirección"});
    }
    if (!correo){
        errors.push({text: "Por favor llenar el campo de correo"});
    }
    if (errors.length > 0) {
      res.render("clientes/new", {
        errors,
        nombre,
        telefono,
        apellido,
        cedula,
        direccion,
        correo
      });
    } else {
      const newCliente = new Cliente({ nombre, apellido, telefono, cedula, direccion, correo, estado });
      console.log(newCliente);
      await newCliente.save();
      req.flash("success", "Cliente creado exitosamente.");
      res.redirect("/cliente/show");
    }
  });

  router.get ("/cliente/show", isLoggedIn, async (req, res, next) => {
    const clientes = await Cliente.find();
    console.log (clientes);
    res.render ("clientes/show" , { clientes });
    });

    router.get ("/cliente/edit/:id", isLoggedIn, async (req, res, next) => {
        const cliente = await Cliente.findById (req.params.id);
        res.render ("clientes/edit" , { cliente });
    });

    router.put("/cliente/edit/:id", isLoggedIn, async (req, res, next) => {
      const { nombre, apellido, telefono, cedula, direccion, correo, estado } = req.body;
      await Cliente.findByIdAndUpdate(req.params.id, {
        nombre,
        apellido,
        telefono,
        cedula,
        direccion,
        correo,
        estado
      });
      req.flash("success", "Cliente actualizado exitosamente.");
      res.redirect("/cliente/show");
    });
    router.delete("/cliente/delete/:id", isLoggedIn, async (req, res, next) => {
      await Cliente.findByIdAndDelete(req.params.id);
      req.flash("success", "Cliente eliminado exitosamente.");
      res.redirect("/cliente/show");
    });




module.exports = router;

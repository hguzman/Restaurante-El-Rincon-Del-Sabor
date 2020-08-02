var express = require("express");
var router = express.Router();
const Cliente = require ("../models/Cliente");

router.get ("/cliente/new", (req, res, next)  => {
    res.render ("clientes/new");
});

router.post("/cliente/new", async (req, res) => {
    const { nombre, apellido, cedula, direccion, correo, estado } = req.body;
    const errors = [];
    if (!nombre) {
      errors.push({ text: "Por favor llenar el campo del nombre" });
    }
    if (!apellido) {
      errors.push({ text: "Por favor llenar el campo del apellido" });
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
        apellido,
        cedula,
        direccion,
        correo
      });
    } else {
      const newCliente = new Cliente({ nombre, apellido, cedula, direccion, correo, estado });
      console.log(newCliente);
      await newCliente.save();
      res.redirect("/cliente/show");
    }
  });

  router.get ("/cliente/show" , async (req, res, next) => {
    const clientes = await Cliente.find();
    console.log (clientes);
    res.render ("clientes/show" , { clientes });
    });

    router.get ("/cliente/edit/:id" , async (req, res, next) => {
        const cliente = await Cliente.findById (req.params.id);
        res.render ("clientes/edit" , { cliente });
    });

    router.put("/cliente/edit/:id", async (req, res, next) => {
      const { nombre, apellido, cedula, direccion, correo, estado } = req.body;
      await Cliente.findByIdAndUpdate(req.params.id, {
        nombre,
        apellido,
        cedula,
        direccion,
        correo,
        estado
      });
      res.redirect("/cliente/show");
    });
    
    
 

module.exports = router;

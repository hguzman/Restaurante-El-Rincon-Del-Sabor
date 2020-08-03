var express = require("express");
var router = express.Router();
const User = require("../models/Signup");

/* GET users listing. */
router.get("/signup", (req, res, next) => {
  res.render("auth/signup");
});
router.post("/signup", async(req, res, next) => {
  const {nombre,apellido,correo,contraseña,validar,celular,cedula,sexo,tyc} = req.body;
  if (contraseña != validar) {
    res.render("auth/signup", {nombre,apellido,correo,celular,cedula});
  } else {
    const emailUser = await User.findOne({correo:correo});
    if (emailUser) {
      req.flash("danger", "este correo ya esta en uso");
      res.redirect("/signup");
    }else{
      const newUser = new User({nombre,apellido,correo,contraseña,validar,celular,cedula,sexo,tyc});
      newUser.contraseña = await newUser.encryptPassword(contraseña);
      await newUser.save();
      req.flash("success", "su registro fue exitoso ", nombre);
      res.redirect("/");
      }
    }
});
router.get("/", (req, res, next) => {
  res.render("auth/signin");
});

module.exports = router;

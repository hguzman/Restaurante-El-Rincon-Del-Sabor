const express = require("express");
const router = express.Router();
const pool = require("../database");
const { isLoggedIn } = require("../lib/auth");

router.get("/new", isLoggedIn, (req, res) => {
  res.render("links/new");
});

router.post("/new", isLoggedIn, async (req, res) => {
  const { plato, precio, descripcion, Estado } = req.body;
  const newPlato = {
    plato,
    precio,
    descripcion,
    Estado
  };
  await pool.query("INSERT INTO menu set ?", [newPlato]);
  req.flash("success", " Plato creado con exito.");
  res.redirect("/list");
});

router.get("/list", isLoggedIn, async (req, res) => {
  const lista = await pool.query("SELECT * FROM menu");
  res.render("links/list", { lista });
});

router.get("/delete/:id", isLoggedIn, async (req, res) => {
  const { id } = req.params;
  await pool.query("DELETE FROM menu WHERE Id = ?", [id]);
  req.flash("danger", "  Plato eliminado.");
  res.redirect("/list");
});

router.get("/edit/:id", isLoggedIn, async (req, res) => {
  const { id } = req.params;
  const plato = await pool.query("SELECT * FROM menu WHERE Id = ?", [id]);
  res.render("links/edit", { plato: plato[0] });
});

router.post("/edit/:id", isLoggedIn, async (req, res) => {
  const { id } = req.params;
  const { plato, precio, descripcion, Estado } = req.body;
  const newPlato = {
    plato,
    precio,
    descripcion,
    Estado
  };
  await pool.query("UPDATE menu set ? WHERE Id = ?", [newPlato, id]);
  req.flash("success", "  Plato Acualizado.");
  res.redirect("/list");
});

router.get("/editprofile/:id", isLoggedIn, async (req, res) => {
  const { id } = req.params;
  const name = await pool.query("SELECT * FROM user WHERE Id = ?", [id]);
  res.render("editprofile", { name: name[0] });
});

router.post("/editprofile/:id", isLoggedIn, async (req, res) => {
  const { id } = req.params;
  const { username, name, fullname, email, mobile } = req.body;
  const newDato = {
    username,
    name,
    fullname,
    email,
    mobile
  };
  await pool.query("UPDATE user set ? WHERE Id = ?", [newDato, id]);
  req.flash("success", "  Datos Acualizado.");
  res.redirect("/profile");
});

router.get("/Addclient", isLoggedIn, async (req, res) => {
  res.render("links/AddClient");
});
router.post("/Addclient", async (req, res) => {
  const {
    nombre,
    apellido,
    cedula,
    telefono,
    direccion,
    correo,
    Estado
  } = req.body;
  const newclient = {
    nombre,
    apellido,
    cedula,
    telefono,
    direccion,
    correo,
    Estado
  };
  await pool.query("insert into cliente set ?", [newclient]);
  res.redirect("/ListClient");
});

//listar los clientes guardados
router.get("/ListClient", isLoggedIn, async (req, res) => {
  const listClient = await pool.query("select * from cliente");
  res.render("links/ListClient", { listClient });
});

//eliminar un cliente

router.get("/ListClient/delete/:id", isLoggedIn, async (req, res) => {
  const { id } = req.params;
  await pool.query("DELETE FROM cliente WHERE Id = ?", [id]);
  req.flash("danger", "Cliente eliminado");
  res.redirect("/ListClient");
});

//editar un clientes
router.get("/EditClient/:id", isLoggedIn, async (req, res) => {
  const { id } = req.params;
  const link = await pool.query("SELECT * FROM cliente WHERE Id = ?", [id]);
  res.render("links/EditClient", { link: link[0] });
});

router.post("/EditClient/:id", isLoggedIn, async (req, res) => {
  const { id } = req.params;
  const {
    nombre,
    apellido,
    cedula,
    telefono,
    direccion,
    correo,
    Estado
  } = req.body;
  const newPlato = {
    nombre,
    apellido,
    cedula,
    telefono,
    direccion,
    correo,
    Estado
  };
  await pool.query("UPDATE cliente set ? WHERE Id = ?", [newPlato, id]);
  console.log(newPlato);
  req.flash("success", "  Datos del cliente actualizados.");
  res.redirect("/Listclient");
});
router.get("/home", isLoggedIn, async (req, res) => {
  const lista = await pool.query("SELECT * FROM menu");
  res.render("home", { lista });
});

router.post("/", isLoggedIn, (req, res) => {
  const datos = req.body;
  console.log(datos);
  redirect("/home");
});

module.exports = router;

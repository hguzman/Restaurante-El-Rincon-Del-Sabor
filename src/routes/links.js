const express = require("express");
const router = express.Router();
const pool = require("../database");
const { isLoggedIn } = require("../lib/auth");

router.get("/new", isLoggedIn, (req, res) => {
  res.render("links/new");
});

router.post("/new", isLoggedIn, async (req, res) => {
  const { plato, precio, descripcion } = req.body;
  const newPlato = {
    plato,
    precio,
    descripcion
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
  const { plato, precio, descripcion } = req.body;
  const newPlato = {
    plato,
    precio,
    descripcion
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

module.exports = router;

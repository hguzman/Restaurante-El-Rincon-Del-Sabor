const express = require('express');
const router  = express.Router();
const pool = require('../database');

router.get('/new', (req, res)=>{
  res.render('links/new');
});

router.post('/new', async(req, res) => {
  const {plato, precio, descripcion} = req.body;
  const newPlato = {
    plato,
    precio,
    descripcion
  };
  await pool.query('INSERT INTO menu set ?', [newPlato]);
  req.flash('success', ' Plato creado con exito.');
  res.redirect('/list');
});

router.get('/list', async(req, res) =>{
  const lista = await pool.query('SELECT * FROM menu');
  res.render('links/list', {lista});
});

router.get('/delete/:id', async(req, res) =>{
  const { id } = req.params;
  await pool.query('DELETE FROM menu WHERE Id = ?', [id]);
  req.flash('danger', '  Plato eliminado.');
  res.redirect('/list');
});

router.get('/edit/:id', async(req, res) =>{
  const { id } = req.params;
  const plato = await pool.query('SELECT * FROM menu WHERE Id = ?', [id]);
  res.render('links/edit', { plato: plato[0]});
});

router.post('/edit/:id', async(req, res) =>{
  const { id } = req.params;
  const { plato, precio, descripcion} = req.body;
  const newPlato = {
    plato,
    precio,
    descripcion
  };
  await pool.query('UPDATE menu set ? WHERE Id = ?', [newPlato, id]);
  req.flash('success', '  Plato Acualizado.');
  res.redirect('/list');
});


module.exports = router;

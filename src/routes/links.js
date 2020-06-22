const express = require('express');
const router  = express.Router();
const pool = require('../database');

router.get('/signup', (req, res) =>{
  res.render('links/signup');
});

router.post('/signup', (req, res) =>{
  res.render('links/signup');
});

router.post('/login', (req, res)=>{
  console.log(req.body);
  res.send('recivido');
});

router.get('/new', (req, res)=>{
  res.render('links/new');
});

router.post('/new', async(req, res) => {
  // console.log(req.body);
  const {plato, precio, descripcion} = req.body;
  const newPlato = {
    plato,
    precio,
    descripcion
  };
  await pool.query('INSERT INTO menu set ?', [newPlato]);
  res.redirect('/list');
});

router.get('/list', async(req, res) =>{
  const lista = await pool.query('SELECT * FROM menu');
  // console.log(lista)
  res.render('links/list', {lista});
});

router.get('/delete/:id', async(req, res) =>{
  const { id } = req.params;
  await pool.query('DELETE FROM menu WHERE Id = ?', [id]);
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
  res.redirect('/list');
});


module.exports = router;

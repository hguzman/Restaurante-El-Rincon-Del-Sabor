const express = require('express');
const router  = express.Router();
const pool = require('../database');

router.get('/signup', (req, res) =>{
  res.render('links/signup');
});

router.post('/signup', (req, res) =>{
  res.render('links/signup');
});

router.get('/add', (req, res)=>{
  res.render('links/add');
});

router.post('/add', async(req, res) => {
  // console.log(req.body);
  const {plato, precio, descripcion} = req.body;
  const newPlato = {
    plato,
    precio,
    descripcion
  };
  await pool.query('INSERT INTO menu set ?', [newPlato]);
  res.send('Guardado');
});

router.post('/login', (req, res)=>{
  console.log(req.body);
  res.send('recivido');
});

module.exports = router;

const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM menu", (err, lista) => {
      if (err) {
        next(err);
      }
      // console.log(lista);
      res.render("links/list", {
        data: lista
      });
    });
  });
};

controller.save = (req, res) => {
  const data = req.body;
  req.getConnection((err, conn) => {
    conn.query("INSERT INTO menu set ?", [data], (err, menu) => {
      console.log(menu);
      res.redirect("/list");
    });
  });
};

controller.delete = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query("DELETE FROM menu WHERE Id = ?", [id], (err, rows) => {
      res.redirect("/list");
    });
  });
};

controller.edit = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM menu WHERE Id = ?", [id], (err, plato) => {
      res.render("links/update", {
        plato: plato[0]
      });
    });
  });
};

controller.update = (req, res) => {
  const { id } = req.params;
  const update = req.body;
  req.getConnection((err, conn) => {
    conn.query("UPDATE menu set ? WHERE Id = ?", [update, id], (err, rows) => {
      res.redirect("/list");
    });
  });
};

controller.search = (req, res) => {
  const { plato } = req.body;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM menu WHERE plato = ?", [plato], (err, data) => {
      res.redirect("/home");
      console.log(data);
    });
  });
};

module.exports = controller;

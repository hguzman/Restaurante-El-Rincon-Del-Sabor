const mongoose = require("mongoose");

mongoose
  .connect("mongodb://localhost/prueba", {
    useCreateIndex: true,
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useFindAndModify: false
  })
  .then(db => console.log("Base de datos conectada"))
  .catch(err => console.error(err));

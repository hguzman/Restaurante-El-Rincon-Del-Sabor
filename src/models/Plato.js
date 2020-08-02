const mongoose = require("mongoose");
const { Schema } = mongoose;

const PlatoSchema = new Schema({
  nombre: { type: String, required: true },
  precio: { type: Number, required: true },
  descripcion: { type: String, required: true },
  estado: {type: String },
  date: { type: Date, default: Date.now }
});

module.exports = mongoose.model("Plato", PlatoSchema);

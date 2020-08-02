const mongoose = require("mongoose");
const { Schema } = mongoose;

const ClienteSchema = new Schema({
  nombre: { type: String, required: true },
  apellido: {type: String, require: true},
  cedula: {type: Number, require: true},
  direccion: {type: String, require: true},
  correo: {type: String, require: true},
  estado: {type: String },
  date: { type: Date, default: Date.now }
});

module.exports = mongoose.model("Cliente", ClienteSchema);
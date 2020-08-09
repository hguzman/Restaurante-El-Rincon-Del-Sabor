const mongoose = require("mongoose");
const { Schema } = mongoose;

const VentaSchema = new Schema({
  fecha: { type: Date, default: Date.now},
  valorTota: {type: Number, required: true},
  cliente: {type: String, required: true },
  productos:[{
    producto: {type: String, required: true},
    cantidad: {type: Number,}
  }]
});
module.exports = mongoose.model("Venta", VentaSchema);

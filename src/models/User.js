const mongoose = require("mongoose");
const { Schema } = mongoose;
const bcrypt = require("bcryptjs");

const UserSchema = new Schema({
  nombre: { type: String, required: true },
  apellido: { type: String, required: true },
  correo: { type: String, required: true },
  contraseña: { type: String, required: true },
  celular: { type: Number, required: true },
  cedula: { type: Number, required: true },
  sexo: { type: String, required: true },
  tyc: { type: String, required: true },
  foto: { type: String}
});

UserSchema.methods.encryptPassword = async contraseña => {
  const salt = await bcrypt.genSalt(10);
  const hash = bcrypt.hash(contraseña, salt);
  return hash;
};

UserSchema.methods.matchPassword = async function(contraseña) {
  return await bcrypt.compare(contraseña, this.contraseña);
};

module.exports = mongoose.model("User", UserSchema);

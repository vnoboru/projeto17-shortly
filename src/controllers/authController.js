import bcrypt from "bcrypt";
import { v4 as uuidV4 } from "uuid";
import connection from "../database/db.js";

export async function postSignup(req, res) {
  const { name, email, password } = req.body;
  console.log(name, email, password);

  try {
    const passwordHash = bcrypt.hashSync(password, 10);
    await connection.query(
      `
      INSERT INTO users (name, email, password)
      VALUES ($1, $2, $3)
      `,
      [name, email, passwordHash]
    );

    return res.status(201).send("Criado com sucesso.");
  } catch (err) {
    return res.status(500).send(err);
  }
}

export async function postSignin(req, res) {
  const { email, password } = req.body;

  try {
    const verifyEmail = await connection.query(
      "SELECT * FROM users WHERE email = $1",
      [email]
    );

    const verifyPassword = await bcrypt.compare(
      password,
      verifyEmail.rows[0].password
    );

    if (verifyEmail.rows.length === 0 || !verifyPassword) {
      return res.sendStatus(401);
    }

    const token = uuidV4();
    await connection.query(
      'INSERT INTO sessions ("userId", token) VALUES ($1, $2)',
      [verifyEmail.rows[0].id, token]
    );

    const session = await connection.query(
      "SELECT * FROM sessions WHERE token = $1",
      [token]
    );
    res.status(200).send(session.rows[0].token);
  } catch (err) {
    res.status(422).send(err);
  }
}

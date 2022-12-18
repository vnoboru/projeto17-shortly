import connection from "../database/db.js";

export async function postSignup(req, res) {
  const { name, email, password } = req.body;

  try {
    await connection.query(
      `
        INSERT INTO 
          users (name, email, password)
        VALUES 
          ($1, $2, $3)
        `,
      [name, email, password]
    );

    res.sendStatus(201);
  } catch (err) {
    res.status(500).send(err);
  }
}

export async function postSignin(req, res) {}

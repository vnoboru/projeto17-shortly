import connection from "../database/db.js";
import signUpSchema from "../schemas/authSchema.js";

export async function postSignupVal(req, res, next) {
  const user = req.body;
  const validation = signUpSchema.validate(user, { abortEarly: false });

  if (validation.error) {
    const errors = validation.error.details.map((detail) => detail.message);
    res.status(422).send(errors);
    console.log(errors);
    return;
  }

  try {
    const verifyEmail = await connection.query(
      `
      SELECT email
      FROM users
      WHERE email = $1
      `,
      [email]
    );

    if (verifyEmail.rows.length > 0) {
      res.status(409).send("Email já foi cadastrado.");
    }
  } catch (err) {
    res.status(422).send(err);
  }

  next();
}

export async function postSigninVal(req, res, next) {}

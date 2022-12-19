import connection from "../database/db.js";
import { signInSchema, signUpSchema } from "../schemas/authSchema.js";

export async function postSignupVal(req, res, next) {
  const user = req.body;
  const validation = signUpSchema.validate(user, { abortEarly: false });

  if (validation.error) {
    const errors = validation.error.details.map((detail) => detail.message);
    return res.status(422).send(errors);
  }

  try {
    const verifyEmail = await connection.query(
      `
      SELECT email
      FROM users
      WHERE email = $1
      `,
      [user]
    );

    if (verifyEmail.rows.length > 0) {
      return res.status(409).send("Email já foi cadastrado.");
    }
  } catch (err) {
    console.log(err);
    return res.status(500).send(err);
  }

  next();
}

export async function postSigninVal(req, res, next) {
  const user = req.body;
  const validation = signInSchema.validate(user, {
    abortEarly: false,
  });

  if (validation.error) {
    const errors = validation.error.details.map((detail) => detail.message);
    return res.status(422).send(errors);
  }

  next();
}

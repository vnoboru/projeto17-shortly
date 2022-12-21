import connection from "../database/db.js";
import { urlSchema } from "../schemas/urlSchema.js";

export async function postUrlVal(req, res, next) {
  const url = req.body;

  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");

  if (!token) {
    return res.sendStatus(401);
  }

  const validation = urlSchema.validate(url, { abortEarly: false });

  if (validation.error) {
    const errors = validation.error.details.map((detail) => detail.message);
    return res.status(422).send(errors);
  }

  res.locals.token = token;
  next();
}

export async function deleteUrlVal(req, res, next) {}

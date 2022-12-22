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

export async function deleteUrlVal(req, res, next) {
  const { id } = req.params;

  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");

  if (!token) {
    return res.sendStatus(401);
  }

  try {
    const user = await connection.query(
      `
    SELECT *
    FROM sessions
    WHERE token = $1
    `,
      [token]
    );
    const userId = user.rows[0].userId;

    const verifyUrlData = await connection.query(
      `
      SELECT * 
      FROM urls
      WHERE "id" = $1
      `,
      [id]
    );

    if (verifyUrlData.rows.length === 0) {
      return res.sendStatus(404);
    }

    if (verifyUrlData.rows[0].userId !== userId) {
      return res.sendStatus(401);
    }
  } catch (err) {
    return res.status(500).send(err);
  }

  next();
}

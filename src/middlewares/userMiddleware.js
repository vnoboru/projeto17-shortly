import connection from "../database/db.js";

export async function getUsersVal(req, res, next) {
  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");

  if (!token) {
    return res.sendStatus(401);
  }

  try {
    const verifySession = await connection.query(
      `
      SELECT *
      FROM sessions
      WHERE token = $1
      `,
      [token]
    );

    if (verifySession.rows.length === 0) {
      return res.sendStatus(404);
    }

    const userId = verifySession.rows[0].userId;
    res.locals.userId = userId;
  } catch (err) {
    return res.status(500).send(err);
  }
  next();
}

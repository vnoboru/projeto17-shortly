import { nanoid } from "nanoid";
import connection from "../database/db.js";

export async function postUrl(req, res) {
  const token = res.locals.token;
  const { url } = req.body;
  const shortUrl = nanoid(6);
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

    const verifyUrl = await connection.query(
      `
      SELECT *
      FROM urls
      WHERE url = $1
      `,
      [url]
    );

    if (verifyUrl.rows.length > 0) {
      return res.sendStatus(409);
    }

    await connection.query(
      `
      INSERT INTO urls ("userId", url, "shortUrl")
      VALUES ($1, $2, $3)
      `,
      [userId, url, shortUrl]
    );
    res.status(201).send({ shortUrl });
  } catch {
    res.sendStatus(500);
  }
}

export async function getUrl(req, res) {}

export async function getShortUrl(req, res) {}

export async function deleteUrl(req, res) {}

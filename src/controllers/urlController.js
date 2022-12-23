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

    return res.status(201).send({ shortUrl });
  } catch (err) {
    return res.status(500).send(err);
  }
}

export async function getUrl(req, res) {
  const { id } = req.params;

  try {
    const urlData = await connection.query(
      `
      SELECT id, "shortUrl", url
      FROM urls WHERE id = $1
      `,
      [id]
    );

    if (urlData.rows.length === 0) {
      return res.sendStatus(404);
    }

    return res.status(200).send(urlData.rows);
  } catch (err) {
    return res.status(500).send(err);
  }
}

export async function getShortUrl(req, res) {
  const { shortUrl } = req.params;

  try {
    const shortUrlData = await connection.query(
      `
      SELECT *
      FROM urls
      WHERE "shortUrl" = $1
      `,
      [shortUrl]
    );

    if (shortUrlData.rows.length === 0) {
      return res.sendStatus(404);
    }

    await connection.query(
      `
      UPDATE urls
      SET "visitCount" = "visitCount" + 1
      WHERE "shortUrl" = $1
      `,
      [shortUrl]
    );

    res.redirect(shortUrlData.rows[0].url);
  } catch (err) {
    res.status(500).send(err);
  }
}

export async function deleteUrl(req, res) {
  const { id } = req.params;

  try {
    await connection.query(
      `
      DELETE FROM urls
      WHERE id = $1
      `,
      [id]
    );

    res.sendStatus(204);
  } catch (err) {
    res.status(500).send(err);
  }
}

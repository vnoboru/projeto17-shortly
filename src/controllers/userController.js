import connection from "../database/db.js";

export async function getUsers(req, res) {
  const userId = res.locals.userId;

  try {
    const object = await connection.query(
      `
      SELECT
        users.id,
        users.name,
        SUM(urls."visitCount") AS "visitCount",
        json_agg(
          json_build_object(
            'id', urls.id,
            'shortUrl', urls."shortUrl",
            'url', urls.url, 'visitCount',
            urls."visitCount"
          )
        ) AS "shortenedUrls"
      FROM users
      JOIN urls
      ON urls."userId" = users.id
      WHERE users.id = $1
      GROUP BY users.id
      `,
      [userId]
    );

    res.send(object.rows).status(200);
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

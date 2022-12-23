import connection from "../database/db.js";

export async function getRanking(req, res) {
  try {
    const objectResult = await connection.query(
      `
      SELECT 
        users.id,
        users.name,
        COUNT(urls."userId") AS "linksCount",
        COALESCE(SUM(urls."visitCount"), 0) AS "visitCount"
      FROM users
      LEFT JOIN urls ON users.id = urls."userId"
      GROUP BY users.id
      ORDER BY "visitCount" DESC
      LIMIT 10
      `
    );

    return res.status(200).send(objectResult.rows);
  } catch (err) {
    return res.status(500).send(err);
  }
}

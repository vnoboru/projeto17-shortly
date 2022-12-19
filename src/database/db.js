import pkg from "pg";
import dotenv from "dotenv";

dotenv.config();
const { Pool } = pkg;

const connection = new Pool({
  connectionString: process.env.PORT
});

export default connection;

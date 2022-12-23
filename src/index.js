import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import authRoute from "./routes/authRoutes.js";
import urlRoute from "./routes/urlRoutes.js";
import rankingRoute from "./routes/rankingRoutes.js";
import usersRoute from "./routes/usersRoutes.js";

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

app.use(authRoute);
app.use(urlRoute);
app.use(rankingRoute);
app.use(usersRoute);

const port = process.env.PORT || 4000;
app.listen(port, () => console.log(`Server running in port ${port}`));

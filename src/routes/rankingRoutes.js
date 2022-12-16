import { Router } from "express";
import { getRanking } from "../controllers/rankingController.js";

const rankingRoute = Router();

rankingRoute.get("/ranking", getRanking);

export default rankingRoute;

import { Router } from "express";
import { deleteUrl, getShortUrl, getUrl, postUrl } from "../controllers/urlController.js";
import { deleteUrlVal, postUrlVal } from "../middlewares/urlMiddleware.js";

const urlRoute = Router();

urlRoute.post("/urls/shorten", postUrlVal, postUrl);
urlRoute.get("/urls/:id", getUrl);
urlRoute.get("/urls/open/:shortUrl", getShortUrl);
urlRoute.delete("urls/:id", deleteUrlVal, deleteUrl);

export default urlRoute;

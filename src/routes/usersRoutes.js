import { Router } from "express";
import { getUsers } from "../controllers/userController.js";
import { getUsersVal } from "../middlewares/userMiddleware.js";

const usersRoute = Router();

usersRoute.get("/users/me", getUsersVal, getUsers);

export default usersRoute;

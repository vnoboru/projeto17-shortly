import { Router } from "express";
import { postSignin, postSignup } from "../controllers/authController.js";
import { postSigninVal, postSignupVal } from "../middlewares/authMiddleware.js";

const authRoute = Router();

authRoute.post("/signup", postSignupVal, postSignup);
authRoute.post("/signin", postSigninVal, postSignin);

export default authRoute;

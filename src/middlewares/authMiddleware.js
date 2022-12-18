import signUpSchema from "../schemas/authSchema.js";

export async function postSignupVal(req, res, next) {
  const user = req.body;
  const validation = signUpSchema.validate(user, { abortEarly: false });

  if (validation.error) {
    const errors = validation.error.details.map((detail) => detail.message);
    res.status(422).send("Preencha os campos corretamente");
    console.log(errors);
    return;
  }

  next();
}

export async function postSigninVal(req, res, next) {}

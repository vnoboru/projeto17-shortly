import joi from "joi";

const signUpSchema = joi.object({
  name: joi.string().min(3).required(),
  email: joi.string().email({ minDomainSegments: 2 }).lowercase().required(),
  password: joi.required(),
  confirmPassword: joi.valid(joi.ref("password")).required(),
});

export default signUpSchema;

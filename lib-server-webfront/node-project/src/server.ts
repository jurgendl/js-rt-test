import express from "express";
import {greet} from "lib-dual-package-build";

const app = express();
const port = 3000;

app.get("/", (_req, res) => {
  res.json({ message: greet("John Doe") });
});

app.listen(port, () => {
  console.log(`Server listening on http://localhost:${port}`);
});

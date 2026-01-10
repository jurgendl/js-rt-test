import fs from "node:fs";
import { execSync } from "node:child_process";

const README = "README.md";
const API_FILE = "docs/README.md";

// Generate API docs
execSync("npx typedoc --out docs", { stdio: "inherit" });

const readme = fs.readFileSync(README, "utf8");
const api = fs.readFileSync(API_FILE, "utf8");

// Clean API content (remove titles)
const apiContent = api
  .split("\n")
  .map(line => line.replace(/\]\((functions\/.*?\.md)\)/g, "]($1)")) // optional, tweak path
  .map(line => line.replace(/^-\s\[(.*?)\]\(functions\//, "- [$1](docs/functions/")) // prepend 'docs/'
  .join("\n")
  .trim();

// Marker-safe replacement
const start = "<!-- API_START -->";
const end = "<!-- API_END -->";

const startIndex = readme.indexOf(start);
const endIndex = readme.indexOf(end, startIndex);

if (startIndex === -1 || endIndex === -1) {
  throw new Error("API markers not found in README");
}

const updated =
  readme.slice(0, startIndex + start.length) +
  "\n\n" +
  apiContent +
  "\n\n" +
  readme.slice(endIndex);

fs.writeFileSync(README, updated);

console.log("README API section updated safely");

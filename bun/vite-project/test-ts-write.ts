// Asynchronous write (callback-based) ==============================

import { writeFile } from "node:fs";

writeFile("output1.txt", "File written successfully\n", "utf8", err => {
  if (err) {
    console.error("Error writing file:", err);
    return;
  }

  console.log("File written successfully");
});

// Promise-based / async–await (recommended) ==============================

import { writeFile as writeFilePromise } from "node:fs/promises";

async function main() {
  try {
    await writeFilePromise("output2.txt", "File written successfully\n", "utf8");
  } catch (err) {
    console.error("Error writing file:", err);
  }
}

main().then(() => {});

//  Synchronous write (CLI / scripts) ==============================

import { writeFileSync } from "node:fs";

try {
  writeFileSync("output3.txt", "File written successfully\n", "utf8");
} catch (err) {
  console.error(err);
}

// large files ==============================

import { createWriteStream } from "node:fs";

const stream = createWriteStream("output4.txt", { encoding: "utf8" });

stream.write("File");
stream.write(" written");
stream.end(" successfully\n");

//  ==============================


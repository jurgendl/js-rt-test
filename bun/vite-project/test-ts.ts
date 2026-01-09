// =========================================================

console.log('Hello world from bun');

// Asynchronous (recommended) =========================================================

import {readFile} from "node:fs";

readFile("test-ts.ts", "utf8", (err, data) => {
	if (err) {
		console.error("Error reading file:", err);
		return;
	}

	console.log(data);
});

// Using Promises / async/await (modern Node) =========================================================

import {readFile as readFilePromise} from "node:fs/promises";

async function main() {
	try {
		const content = await readFilePromise("test-ts.ts", "utf8");
		console.log(content);
	} catch (err) {
		console.error("Error reading file:", err);
	}
}

main().then(() => {
});

// Synchronous (CLI scripts, quick tests) =========================================================

import {readFileSync} from "node:fs";

try {
	const content = readFileSync("test-ts.ts", "utf8");
	console.log(content);
} catch (err) {
	console.error("Error reading file:", err);
}

// Very large files (streaming) =========================================================

import { createReadStream } from "node:fs";

const stream = createReadStream("test-ts.ts", { encoding: "utf8" });

stream.on("data", chunk => process.stdout.write(chunk));
stream.on("error", err => console.error(err));

// =========================================================

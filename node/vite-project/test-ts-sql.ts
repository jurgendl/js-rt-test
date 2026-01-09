// =========================================================

import { DatabaseSync } from "node:sqlite";

const db = new DatabaseSync(":memory:");
const query = db.prepare("SELECT 'Hello world from node' AS message");
const result = query.get();
console.log(result); // => { message: 'Hello world from node' }

// =========================================================

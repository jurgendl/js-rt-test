// =========================================================

import { DatabaseSync } from "node:sqlite";

const db = new DatabaseSync("mydb.sqlite"); // :memory:
const query = db.prepare("select 'Hello world from node' as message");
const result = query.get();
console.log(result); // => { message: 'Hello world from node' }

// =========================================================

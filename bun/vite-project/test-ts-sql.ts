// =========================================================

import { Database } from "bun:sqlite";

using db = new Database("mydb.sqlite");
using query = db.query("select 'Hello world from bun' as message;");
console.log(query.get()); // => { message: "Hello world from bun" }

// =========================================================

// =========================================================

// deno add jsr:@db/sqlite
import { Database } from "@db/sqlite";

const db = new Database(":memory:");
const query = db.prepare("SELECT 'Hello world from deno' AS message");
const result = query.get();
console.log(result); // { message: "Hello world from deno" }
db.close();

// =========================================================

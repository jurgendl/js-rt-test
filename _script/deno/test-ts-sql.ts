// =========================================================

// deno add jsr:@db/sqlite
import { Database } from "@db/sqlite";

const db = new Database("mydb.sqlite"); // :memory:
const query = db.prepare("select 'Hello world from deno' as message");
const result = query.get();
console.log(result); // { message: "Hello world from deno" }
db.close();

// =========================================================

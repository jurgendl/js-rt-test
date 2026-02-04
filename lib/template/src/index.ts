import { goodbye } from "./lib-extra.js";
export { goodbye } from "./lib-extra.js";

/**
* Returns a greeting message
*
* @param name - Name of the person to greet
* @returns A greeting string
* .
* @note Note
*
* @example
* ```TypeScript
* import { greet, goodbye } from "@local/my-ts-lib";
* console.log(greet("John")); // Hello, John!
* ```
*/
export function greet(name: string): string {
  return `Hello, ${name}! ${goodbye((name))}`;
}
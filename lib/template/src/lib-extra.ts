/**
* Returns a goodbye message
*
* @param name - Name of the person to say goodbye to
* @returns A goodbye string
* .
* @note Note
*
* @example
* ```TypeScript
* import { greet, goodbye } from "@local/my-ts-lib";
* console.log(goodbye("John")); // Goodbye, John!
* ```
*/
export function goodbye(name: string): string {
	return `Goodbye, ${name}!`;
}
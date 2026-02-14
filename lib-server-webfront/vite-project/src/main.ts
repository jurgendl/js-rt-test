import {greet} from "lib-dual-package-build";

document.querySelector<HTMLDivElement>('#app')!.innerHTML = greet("John Doe");

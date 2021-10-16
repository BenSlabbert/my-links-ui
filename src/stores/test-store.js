import { writable } from "svelte/store";
import { readable } from "svelte/store";

const testStore = writable([
  { name: "1" },
  { name: "2" },
  { name: "3" }
]);

let count = 0;

const timer = readable(count, (set) => {
  const interval = setInterval(() => {
    count++;
    set(count);
  }, 1000);

  // clean up function
  return () => {
    clearInterval(interval);
  }
});

export {
  testStore,timer
};

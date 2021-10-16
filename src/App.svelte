<script>
import { onDestroy } from "svelte";
import { testStore } from "./stores/test-store";
import { timer } from "./stores/test-store";
import LoginForm from "./LoginForm.svelte";

let counter;

timer.subscribe((count) => {
  counter = count;
});

let items;
$: console.log({ items });

const unsubscribe = testStore.subscribe((updatedStoreValues) => {
  items = updatedStoreValues;
});

// always clear the subscription
onDestroy(() => {
  if (unsubscribe) {
    unsubscribe();
  }
});

console.log("store as initial values %o", { items });
items.forEach((val, idx) => console.log({ idx }, { val }));

testStore.set([]);
console.log("store now empty %o", { items });

testStore.update((currItems) => {
  console.log("updating store %o", { currItems });
  let newItems = [
    ...currItems,
    {
      name: "updated store!",
    },
  ];

  console.log("updated store %o", { newItems });

  return newItems;
});

export let name = "initial"; // if not initialized by props
console.log({ name });
</script>

<p>counter: {counter}</p>

<LoginForm />

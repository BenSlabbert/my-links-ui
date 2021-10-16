<script>
import { onDestroy } from "svelte";
import { userStore } from "../store/stores";

let userData;

const unsubscribe = userStore.subscribe((updatedStoreValues) => {
  userData = updatedStoreValues;
});

// always clear the subscription
onDestroy(() => {
  if (unsubscribe) {
    unsubscribe();
  }
});

function handleLogout() {
  userStore.set(null);
  // $userStore = null;
}

$: console.log(userData);
</script>

<h2>All your uris</h2>

<p>username: {userData.username}</p>
<p>password: {userData.password}</p>

<button on:click="{handleLogout}">Logout</button>

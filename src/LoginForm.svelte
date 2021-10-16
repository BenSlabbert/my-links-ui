<style>
h1 {
  color: aqua;
}
</style>

<script>
import { testStore } from "./stores/test-store";

let username = "";
let password = "";
let formValid = true;

$: console.log("username ", username);
$: console.log("password ", password);
$: formValid = !(username === "" || password === "");

function formSubmit() {
  if (!formValid) {
    console.error("form not valid");
    return;
  }

  console.group("formSubmit{}");
  console.error("form valid");
  console.log("username ", username);
  console.log("password ", password);
  console.groupEnd();
}
</script>

<ul>
  <!--this is the auto subscribe/unsubscribe managed by svelte-->
  <!--great if you just want to read from the store-->
  {#each $testStore as item}
    <li>{item.name}</li>
  {/each}
</ul>

<h1>H1 tag</h1>

<form on:submit|preventDefault="{formSubmit}">
  <input type="text" placeholder="username" bind:value="{username}" />
  <input type="password" placeholder="password" bind:value="{password}" />
  <button type="submit">submit</button>
</form>

<script>
import { Route } from "svelte-navigator";
import PrivateRouteGuard from "./PrivateRouteGuard.svelte";

export let path;
</script>

<Route path="{path}" let:params let:location let:navigate>
  <PrivateRouteGuard>
    <slot params="{params}" location="{location}" navigate="{navigate}" />
  </PrivateRouteGuard>
</Route>

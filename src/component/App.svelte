<script>
import { Router, Route } from "svelte-navigator";
import Login from "./Login.svelte";
import PrivateRoute from "./PrivateRoute.svelte";
import Uris from "./Uris.svelte";
</script>

<Router>
  <header>
    <h1>My Links</h1>
  </header>

  <main>
    <Route path="login">
      <Login />
    </Route>

    <PrivateRoute path="/" let:location>
      <!--if the user is logged in they will be shown this-->
      <Uris />
    </PrivateRoute>
  </main>
</Router>

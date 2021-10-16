<script>
import { useNavigate, useLocation } from "svelte-navigator";
import { userStore } from "../store/stores";

const navigate = useNavigate();
const location = useLocation();

$: if (!$userStore) {
  navigate("/login", {
    state: { from: $location.pathname },
    replace: true,
  });
}
</script>

{#if $userStore}
  <slot />
{/if}

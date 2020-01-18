<template>
  <div class="header">
    <router-link class="text-decoration-none" to="/">
      <h1 class="header-brand">stylelist</h1>
    </router-link>

    <div class="header-links">
      <router-link class="header-link" to="/favourites">Favourites</router-link>
      <router-link class="header-link" to="/settings">Settings</router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "Header"
};
</script>


<style lang="scss" scoped>
@import "../variables";

.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  position: fixed;
  top: 0;
  width: 100%;
  height: $base-header-height;
  padding: 0 40px;
  background-color: white;
  font-size: 16px;
  box-sizing: border-box;

  * {
    box-sizing: inherit;
  }

  .header-brand {
    font-family: $pretty-font-family;
    font-size: 2em;
    color: $blue_black;
    margin: 0;
  }

  .header-links {
    font-size: 1em;

    > a {
      margin-right: 5px;
    }

    :last-child {
      margin-right: 0;
    }

    .header-link {
      color: $blue_black;
    }
  }

  @media screen and (min-width: $phone) and (max-width: $tablet) {
    font-size: 14px;
  }

  @media screen and (max-width: $phone) {
    font-size: 12px;
  }
}
</style>


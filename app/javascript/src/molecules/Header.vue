<template>
  <div class="header">
    <h1 class="header-brand">stylelyst</h1>
    <router-link class="header-settings header-link" to="/settings">Settings</router-link>
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
  padding: 0 20px;
  background-color: white;
  font-size: 16px;

  .header-brand {
    font-size: 2em;
  }

  .header-page {
    font-size: 1em;
  }

  .header-link {
    font-size: 1em;
  }

  * {
    margin: 0 15px 0 0;
  }

  a:last-child {
    margin: 0 0 0 auto;
  }

  @media screen and (min-width: $phone) and (max-width: $tablet) {
    padding: 0 10px;
    font-size: 15px;
  }

  @media screen and (max-width: $phone) {
    padding: 0 5px;
    font-size: 14px;
  }
}
</style>


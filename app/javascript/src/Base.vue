<template>
  <div>
    <Header />
    <div class="view-container">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
import "@fortawesome/fontawesome-free/css/all";
import Header from "src/molecules/Header";

export default {
  name: "app",
  components: {
    Header
  }
};
</script>

<style lang="scss" scoped>
@import "./variables";

.view-container {
  margin: $base-header-height 25px 0;
}
</style>

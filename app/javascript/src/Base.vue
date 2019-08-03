<template>
  <div>
    <Header />
    <div>
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

<style lang="sass" scoped> 
</style>

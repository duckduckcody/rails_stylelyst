<template>
  <div>
    <p v-if="!favouriteItems || !favouriteItems.length">No favourites</p>
    <div v-for="favouriteItem in favouriteItems" :key="favouriteItem">{{favouriteItem}}</div>
  </div>
</template>

<script>
import Cookie from "js-cookie";

export default {
  name: "Favourites",
  data() {
    return {
      favouriteItems: Cookie.getJSON("favourites") || ""
    };
  },
  methods: {}
};
</script>

<style lang="scss" scoped>
</style>

<template>
  <div class="container">
    <p v-if="!favouriteItems || !favouriteItems.length">No favourites</p>
    <div
      v-for="favouriteItem in favouriteItems"
      :key="favouriteItem"
      class="favouriteItem"
    >
      <a :href="favouriteItem" target="_blank">{{ favouriteItem }}</a>
      <i
        class="fas fa-heart color-red clickable"
        v-on:click="unfavouriteItem(favouriteItem)"
      />
    </div>
  </div>
</template>

<script>
import Cookie from "js-cookie";

export default {
  name: "Favourites",
  inject: ["notyf"],
  data() {
    return {
      favouriteItems: Cookie.getJSON("favourites") || ""
    };
  },
  methods: {
    unfavouriteItem(itemUrl) {
      this.favouriteItems = this.favouriteItems.filter(
        item => item !== itemUrl
      );
      Cookie.set("favourites", this.favouriteItems, {
        expires: 365
      });
      this.notyf.success({
        message: "Item has been unfavourited",
        icon: { text: "👋" }
      });
    }
  }
};
</script>

<style lang="scss" scoped>
.container {
  margin: 0 50px;
}

.favouriteItem {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
</style>

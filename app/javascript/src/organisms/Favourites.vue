<template>
  <div class="container">
    <p v-if="!favouriteItems || !favouriteItems.length">No favourites</p>
    <div v-for="favouriteItem in favouriteItems" :key="favouriteItem" class="favouriteItem">
      {{favouriteItem}}
      <i
        class="fas fa-star gold-star clickable"
        v-on:click="unfavouriteItem(favouriteItem)"
      />
    </div>
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
  methods: {
    unfavouriteItem(itemUrl) {
      this.favouriteItems = this.favouriteItems.filter(
        item => item !== itemUrl
      );
      Cookie.set("favourites", this.favouriteItems, {
        expires: 365
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

.gold-star {
  color: gold;
}
</style>

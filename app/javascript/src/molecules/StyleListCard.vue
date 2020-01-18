<template>
  <div class="card">
    <div class="card-image-container">
      <a :href="clothe.link" target="_blank">
        <img class="lazy card-image" :data-src="clothe.image" />
      </a>
    </div>
    <div class="card-info-container">
      <p class="card-brand uppercase font-weight-light" v-if="clothe.brand">
        {{ clothe.brand }}
      </p>
      <p class="card-name capitalize">
        <b>{{ clothe.name }}</b>
      </p>
      <p class="card-price">
        <span>${{ clothe.price }}</span>
        <i
          class="far fa-heart clickable"
          v-if="!clothe.isFavourited"
          v-on:click="favouriteItem(clothe)"
        ></i>
        <i
          class="fas fa-heart color-red clickable"
          v-else
          v-on:click="unfavouriteItem(clothe)"
        ></i>
      </p>
      <p v-if="clothe.sizzle_text">{{ clothe.sizzle_text }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "StyleListCard",
  props: {
    clothe: Object,
    favouriteItem: Function,
    unfavouriteItem: Function
  }
};
</script>

<style lang="scss" scoped>
@import "../variables";

.card {
  flex: 0 0 25%;
  padding: 15px;
  font-size: 15px;

  .card-info-container {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 60px;

    .card-brand {
      font-size: 0.8em;
    }

    .card-name {
      font-size: 1em;
      font-family: $pretty-font-family;
    }

    .card-price {
      font-size: 0.95em;
      display: flex;
      flex-flow: row nowrap;
      justify-content: space-between;
      align-items: center;
    }
  }

  .card-image-container {
    .card-image {
      width: 100%;
    }
  }

  @media screen and (min-width: $phone) and (max-width: $tablet) {
    flex: 0 0 33%;
    font-size: 14px;
  }

  @media screen and (max-width: $phone) {
    flex: 0 0 50%;
    font-size: 13px;
  }
}
</style>

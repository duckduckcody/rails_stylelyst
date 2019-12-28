<template>
  <div>
    <transition-group class="cards-container" name="clothes-list" tag="div">
      <StyleListCard
        v-for="(clothe, index) in clothes"
        :key="clothe.name + index"
        :clothe="clothe"
      />
    </transition-group>
    <div class="empty-message">
      <span v-if="!clothes.length && !loadingClothes && !loadingError">
        This list has no styles.
        <br />Select 'Settings' in the top right to select your style.
      </span>
      <span v-if="loadingClothes && !loadingError">
        <i class="fas fa-spinner fa-spin"></i>
        Fetching
        <span v-if="!clothes.length">your</span>
        <span v-if="clothes.length">more</span>
        styles...
      </span>
      <span v-if="!loadingClothes && loadingError">Error loading your styles. Please try again.</span>
    </div>
  </div>
</template>

<script>
import Cookie from "js-cookie";
import _ from "lodash";
import LazyLoad from "vanilla-lazyload";
import postJson from "src/interactors/postJson";
import StyleListCard from "src/molecules/StyleListCard";

export default {
  name: "styleList",
  components: {
    StyleListCard
  },
  data() {
    return {
      clothes: [],
      loadingClothes: false,
      loadingError: false,
      page: 0,
      lazyLoad: null,
      category: Cookie.get("category"),
      websites: Cookie.get("websites"),
      scrollDebounceWaitTime: 150,
      bottomOfPageIntersectionReduction: 750
    };
  },
  mounted() {
    this.lazyLoad = new LazyLoad({
      elements_selector: ".lazy"
    });
  },
  created() {
    this.getClothes();
    window.addEventListener(
      "scroll",
      _.debounce(this.isBottomOfPage, this.scrollDebounceWaitTime)
    );
  },
  methods: {
    isBottomOfPage() {
      if (
        window.innerHeight + window.scrollY >=
          document.body.offsetHeight - this.bottomOfPageIntersectionReduction &&
        !this.loadingClothes
      ) {
        this.getClothes();
      }
    },
    getClothes() {
      this.page += 1;
      this.loadingClothes = true;
      postJson({
        url: "/clothes/get_all_clothes",
        body: {
          page: this.page,
          category: this.category,
          websites: this.websites
        }
      })
        .then(({ json }) => this.setClothes(json.clothes))
        .catch(() => (this.loadingError = true))
        .finally(() => (this.loadingClothes = false));
    },
    setClothes(clothes) {
      this.clothes = this.clothes.concat(clothes);
      this.$nextTick(() => this.lazyLoad.update());
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../variables";

.cards-container {
  margin-top: $base-header-height;
  display: flex;
  flex-flow: row wrap;

  .clothes-list-enter-active {
    transition: all 1s;
  }

  .clothes-list-enter {
    opacity: 0;
    transform: translateY(30px);
  }
}
</style>

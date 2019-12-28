<template>
  <form id="settingsForm" class="settings-form">
    <div v-if="loadingSettings" class="empty-message">
      <i class="fas fa-spinner fa-spin"></i>
      Loading Settings
    </div>
    <div v-else>
      <h3>Gender</h3>
      <label class="radio" v-for="gender in genders" :key="'gender_' + gender.id">
        <input
          type="radio"
          name="gender"
          :value="gender.id"
          v-model="formData.gender"
          @click="clickGender"
        />
        {{ gender.name }}
      </label>

      <h3>Category</h3>
      <div class="settings-category-radio-container">
        <label
          class="settings-category-radio radio"
          v-for="category in matchedCategories"
          :key="'category_' + category.id"
        >
          <input type="radio" name="category" :value="category.id" v-model="formData.category" />
          {{ category.name }}
        </label>
        <div v-if="!matchedCategories.length">Please select a gender</div>
      </div>

      <h3>Website</h3>
      <div v-for="website in websites" :key="'website_' + website.id">
        <input type="checkbox" :id="website.id" :value="website.id" v-model="formData.websites" />
        <label :for="website.id">{{ website.name }}</label>
      </div>
      <div v-if="!websites.length">Please select a gender and category</div>

      <div v-if="formErrors.length">
        <p>Oops. Some more information is required before continuing.</p>
        <ul>
          <li v-for="formError in formErrors" :key="formError">{{formError}}</li>
        </ul>
      </div>

      <div style="margin-top:15px">
        <button @click="clickFormSubmit" type="button" id="form-submit-button">Save</button>
        <router-link class="header-settings header-link" to="/">Cancel</router-link>
      </div>
    </div>
  </form>
</template>

<script>
import Cookie from "js-cookie";
import _ from "lodash";
import getJson from "src/interactors/getJson";
import postJson from "src/interactors/postJson";

export default {
  name: "Settings",
  data() {
    return {
      formData: {
        gender: undefined,
        category: undefined,
        websites: []
      },
      formErrors: [],
      genders: [],
      categories: [],
      websites: [],
      loadingSettings: false
    };
  },
  computed: {
    matchedCategories() {
      return _.filter(
        this.categories,
        function(category) {
          return category.gender_id == this.formData.gender;
        }.bind(this)
      );
    },
    selectedCategory() {
      return this.formData.category;
    }
  },
  watch: {
    selectedCategory() {
      this.getWebsites();
    }
  },
  created() {
    this.getSettings();
  },
  methods: {
    getSettings: function() {
      this.loadingSettings = true;
      getJson({ url: "/settings/get_all_settings" }).then(({ json }) => {
        this.categories = json.categories;
        this.genders = json.genders;
        this.formData.category = Cookie.get("category");
        this.formData.gender = Cookie.get("gender");
        this.formData.websites = Cookie.getJSON("websites");
        this.loadingSettings = false;
      });
    },
    clickGender: function() {
      this.formData.category = null;
      this.websites = [];
    },
    getWebsites: function() {
      postJson({
        url: "/settings/get_website_settings_by_category",
        body: { category: this.formData.category }
      }).then(({ json }) => {
        this.websites = json.websites;
        this.fillWebsites();
      });
    },
    fillWebsites: function() {
      var websiteCopy = this.formData.websites;
      this.formData.websites = [];
      _.forEach(
        websiteCopy,
        function(websiteId) {
          _.some(this.websites, ["id", websiteId])
            ? this.formData.websites.push(websiteId)
            : "";
        }.bind(this)
      );
    },
    clickFormSubmit: function() {
      if (this.formIsValid()) {
        var options = {
          expires: 365
        };
        Cookie.set("gender", this.formData.gender, options);
        Cookie.set("category", this.formData.category, options);
        Cookie.set("websites", this.formData.websites, options);
        this.$router.push("/");
      }
    },
    formIsValid: function() {
      if (
        this.formData.gender &&
        this.formData.category &&
        this.formData.websites.length
      ) {
        return true;
      }

      this.formErrors = [];
      !this.formData.gender ? this.formErrors.push("Gender required") : "";
      !this.formData.category ? this.formErrors.push("Category required") : "";
      !this.formData.websites.length
        ? this.formErrors.push("At least one website is required")
        : "";
    }
  }
};
</script>

<style lang="scss" scoped>
@import "../variables";

.settings-form {
  padding: $base-header-height 25px 0;

  .settings-category-radio-container {
    display: flex;
    flex-flow: row wrap;

    .settings-category-radio {
      flex: 0 0 25%;

      @media screen and (min-width: $phone) and (max-width: $tablet) {
        flex: 0 0 50%;
      }

      @media screen and (max-width: $phone) {
        flex: 0 0 100%;
      }
    }
  }
}
</style>

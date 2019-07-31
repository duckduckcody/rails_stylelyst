<template>
    <form id="settingsForm" class="settings-form">
        <h1>Settings</h1>
        <div v-if="loadingSettings" class="empty-message">
            <i class="fas fa-spinner fa-spin"></i>
            Loading Settings
        </div>
        <div v-else>
            <h3>Gender</h3>
            <label class="radio" v-for="gender in genders" :key="'gender_' + gender.id">
                <input type="radio" name="gender" :value="gender.id" v-model="formData.gender" @click="clickGender" />
                {{ gender.name }}
            </label>

            <h3>Category</h3>
            <div class="settings-category-radio-container">
                <label class="settings-category-radio radio" v-for="category in matchedCategories" :key="'category_' + category.id">
                    <input type="radio" name="category" :value="category.id" v-model="formData.category" />
                    {{ category.name }}
                </label>
                <div v-if="!matchedCategories.length && !categorySearchBoxQuery">
                    Please select a gender
                </div>
                <div v-if="!matchedCategories.length && categorySearchBoxQuery">
                    No category found for this search
                </div>
            </div>

            <h3>Website</h3>
            <div v-for="website in filteredWebsites" :key="'website_' + website.id">
                <input type="checkbox" :id="website.id" :value="website.id" v-model="formData.websites">
                <label :for="website.id">{{ website.name }}</label>
            </div>
            <div v-if="!websites.length && !websiteSearchBoxQuery">
                Please select a gender and category
            </div>
            <div v-if="!filteredWebsites.length && websiteSearchBoxQuery">
                No websites found for this search
            </div>

            <div v-if="formErrors.length">
                <p>Oops. Some more information is required before continuing.</p>
                <ul>
                    <li v-for="formError in formErrors" :key="formError">
                        {{formError}}
                    </li>
                </ul>
            </div>

            <div style="margin-top:15px">
                <button @click="clickFormSubmit" type="button" id="form-submit-button">Save</button>
                <router-link class="header-settings header-link" to="/">
                    Cancel
                </router-link>
            </div>
        </div>
    </form>
</template>

<script>
import Cookie from 'js-cookie'
import _ from 'lodash'
import getJson from "./interactors/getJson"
import postJson from "./interactors/postJson"

export default {
    name: 'settings',
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
            categorySearchBoxQuery: "",
            websiteSearchBoxQuery: "",
            loadingSettings: false
        }
    },
    computed: {
        matchedCategories() {
            return _.filter(this.categories, function (category) {
                var searchFlag = true;
                if (this.categorySearchBoxQuery) {
                    searchFlag = category.name.toLowerCase().indexOf(this.categorySearchBoxQuery.toLowerCase()) !== -1
                }
                return category.gender_id == this.formData.gender && searchFlag
            }.bind(this))
        },
        selectedCategory() {
            return this.formData.category
        },
        filteredWebsites() {
            if (this.websiteSearchBoxQuery) {
                return _.filter(this.websites, function (website) {
                    return website.name.toLowerCase().indexOf(this.websiteSearchBoxQuery.toLowerCase()) !== -1
                }.bind(this))
            }
            return this.websites
        }
    },
    watch: {
        selectedCategory() {
            this.fetchWebsites()
        }
    },
    created() {
        this.loadingSettings = true
        getJson({url: '/clothes/get_settings'}).then(({json}) => {
            this.categories = json.categories
            this.genders = json.genders
            this.formData.category = Cookie.get('category')
            this.formData.gender = Cookie.get('gender')
            this.formData.websites = Cookie.getJSON('websites')
            this.loadingSettings = false;
        })
    },
    methods: {
        clickGender: function () {
            this.formData.category = null;
            this.websites = []
        },
        fetchWebsites: function () {
            postJson({url: '/clothes/website_match', body:{'category': this.formData.category}}).then(({json}) => {
                this.websites = json.websites
                this.fillWebsites()
            })
        },
        fillWebsites: function () {
            var websiteCopy = this.formData.websites
            this.formData.websites = []
            _.forEach(websiteCopy, function (websiteId) {
                _.some(this.websites, ['id', websiteId]) ? this.formData.websites.push(websiteId) : ''
            }.bind(this))
        },
        clickFormSubmit: function () {
            if (this.formIsValid()) {
                var options = {
                    expires: 365
                }
                Cookie.set('gender', this.formData.gender, options)
                Cookie.set('category', this.formData.category, options)
                Cookie.set('websites', this.formData.websites, options)
                this.$router.push('/')
            }
        },
        formIsValid: function () {
            if (this.formData.gender && this.formData.category && this.formData.websites.length) {
                return true;
            }

            this.formErrors = [];
            !this.formData.gender ? this.formErrors.push('Gender required') : ''
            !this.formData.category ? this.formErrors.push('Category required') : ''
            !this.formData.websites.length ? this.formErrors.push('At least one website is required') : ''
        }
    }
}
</script>

<style lang="sass" scoped>
$phone: 576px;
$tablet: 768px;

.settings-form {
    padding: 0 25px;

    .search-box-container {
        display: flex;
        margin: 20px 0;

        .search-box {
            flex: 1 1 75%;
            text-align: center;
            padding: 5px;
        }

        .search-clear-button {
            flex: 0 0 10%;
        }
    }

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

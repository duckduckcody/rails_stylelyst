<template>
<div>
    <transition-group class="cards-container" name="clothes-list" tag="div">
        <div class="card" v-for="clothe in clothes" :key="clothe.name">
            <div class="card-image-container">
                <a :href="clothe.link" target="_blank">
                    <img class="lazy card-image" :data-src="clothe.image">
                </a>
            </div>
            <div class="card-info-container">
                <p class="card-brand uppercase font-weight-light" v-if="clothe.brand">
                    {{clothe.brand}}
                </p>
                <p class="card-name capitalize">
                    <b>{{clothe.name}}</b>
                </p>
                <p class="card-price">
                    ${{clothe.price}}
                    <i class="far fa-star clickable" @click="favouriteClick(clothe.link)"></i>
                </p>
                <p v-if="clothe.sizzle_text">
                    {{clothe.sizzle_text}}
                </p>
            </div>
        </div>
    </transition-group>
    <div class="empty-message">
        <span v-if="!clothes.length && !loadingClothes">
            This list has no styles. <br>
            Select 'Settings' in the top right to select your style.
        </span>
        <span v-if="loadingClothes">
            <i class="fas fa-spinner fa-spin"></i>
            Fetching
            <span v-if="!clothes.length">your</span>
            <span v-if="clothes.length">more</span>
            styles...
        </span>
    </div>
</div>
</template>

<script>
import Cookie from 'js-cookie'
import _ from 'lodash'
import LazyLoad from "vanilla-lazyload"
import postJson from './interactors/postJson'

export default {
    name: 'styleList',
    data() {
        return {
            clothes: [],
            loadingClothes: false,
            page: 0,
            lazyLoad: null,
            category: Cookie.get('category'),
            websites: Cookie.get('websites'),
            scrollDebounceWaitTime: 150,
            bottomOfPageIntersectionReduction: 750
        }  
    },
    mounted() {
        this.lazyLoad = new LazyLoad({
            elements_selector: ".lazy"
        })
    },
    created() {
        this.getClothes()
        window.addEventListener('scroll', _.debounce(this.isBottomOfPage, this.scrollDebounceWaitTime))
    },
    methods: {
        isBottomOfPage() {
            if (
                ((window.innerHeight + window.scrollY) >= document.body.offsetHeight - this.bottomOfPageIntersectionReduction) &&
                !this.loadingClothes
            ) {
                this.getClothes()
            }
        },
        favouriteClick(link) {
            var cookies = Cookie.getJSON('favourites')
            _.indexOf(cookies, link) === -1 ?
                this.addFavourite(link, cookies) :
                this.removeFavourite(link, cookies)
        },
        addFavourite(link, cookies) {
            !cookies ? cookies = [] : ''
            Cookies.set('favourites', cookies.concat(link), {
                expires: 365
            })
        },
        removeFavourite(link, cookies) {
            _.pull(cookies, link)
            Cookies.set('favourites', cookies, {
                expires: 365
            })
        },
        getClothes() {
            this.page += 1
            this.loadingClothes = true
            postJson({
                    url: '/clothes/get_clothes', 
                    body:{
                        'page': this.page,
                        'category': this.category,
                        'websites': this.websites
                    }
                })
                .then(({json}) => {
                    this.loadingClothes = false
                    this.setClothes(json.clothes)
                })
        },
        setClothes(clothes) {
            this.clothes = this.clothes.concat(clothes)
            this.$nextTick(() => this.lazyLoad.update())
        }
    }
}
</script>

<style lang="sass" scoped>
$phone: 576px;
$tablet: 768px;
$header-height: 60px;

.cards-container {
    margin-top: $header-height;
    display: flex;
    flex-flow: row wrap;

    .clothes-list-enter-active {
        transition: all 1s;
    }

    .clothes-list-enter {
        opacity: 0;
        transform: translateY(30px);
    }

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
            }

            .card-price {
                font-size: 0.95em;
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
}
</style>

import Vue from "vue";
import VueRouter from "vue-router";
import StyleList from "src/organisms/StyleList";
import Settings from "src/organisms/Settings";
import Favourites from "src/organisms/Favourites"

Vue.use(VueRouter);
const routes = [
  {
    path: "/",
    component: StyleList
  },
  {
    path: "/settings",
    component: Settings
  },
  {
    path: "/favourites",
    component: Favourites
  },
];

export default new VueRouter({ routes });

import Vue from "vue";
import VueRouter from "vue-router";
import StyleList from "src/organisms/StyleList";
import Settings from "src/organisms/Settings";

Vue.use(VueRouter);
const routes = [
  {
    path: "/",
    component: StyleList
  },
  {
    path: "/settings",
    component: Settings
  }
];

export default new VueRouter({ routes });

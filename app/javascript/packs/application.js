import Vue from "vue";
import router from "src/router";
import Base from "src/Base";
import "src/application.scss";

document.addEventListener("DOMContentLoaded", () => {
  const app = new Vue({
    router,
    render: h => h(Base)
  }).$mount();
  document.body.appendChild(app.$el);
});

import "core-js/stable";
import "regenerator-runtime/runtime";
import Vue from "vue";
import router from "src/router";
import Base from "src/Base";
import "src/application.scss";
import { Notyf } from 'notyf';
import 'notyf/notyf.min.css';

document.addEventListener("DOMContentLoaded", () => {
  const app = new Vue({
    provide: () => {
      return {
        notyf: new Notyf({
          duration: 5000 // Set your global Notyf configuration here
        })
      }
    },
    router,
    render: h => h(Base)
  }).$mount();
  document.body.appendChild(app.$el);
});

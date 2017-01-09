import "font-awesome/css/font-awesome.css";
import "bulma/css/bulma.css";
import Vue from "vue";
import VueRouter from "vue-router";
import App from "./App";

Vue.use(VueRouter);

const routes = [
    {path: '/'}
];

const router = new VueRouter({routes});

new Vue({
    router,
    ...App
}).$mount("#app");

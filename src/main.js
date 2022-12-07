import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";

import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap";
import axios from "axios";

axios.defaults.baseURL = 'http://0.0.0.0:8000';

const app = createApp(App);

app.use(router);

app.mount("#app");

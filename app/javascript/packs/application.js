// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"



Rails.start()
Turbolinks.start()
ActiveStorage.start()

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "chartkick/highcharts";
import "bootstrap";
import "controllers"
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete} from '../plugins/init_autocomplete';
import { dynamicTabs } from '../components/onglets';
import {initChatroomCable} from '../channels/chatroom_channel';
import {notifications} from '../channels/notification_channel';
import { load_quagga } from '../plugins/init_quagga'
import { addClassActive } from '../components/navbar';
import { initFlatpickr } from "../plugins/flatpickr";
import {incrementButtons} from "../components/increment_buttons";
import { initSelect2 } from '../components/init_select2';


// Internal imports, e.g:

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initMapbox();
  initAutocomplete();
  dynamicTabs();
  load_quagga();
  initChatroomCable();
  addClassActive();
  initFlatpickr();
  notifications();
  incrementButtons();
  initSelect2();
});


import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr("#event_start_time", {
    enableTime: true,
    altInput: true,
    plugins: [new rangePlugin({ input: "#event_end_time"})]
  });
}

export { initFlatpickr };

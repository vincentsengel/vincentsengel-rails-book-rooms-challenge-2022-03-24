import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    mode: "range",
    minDate: "today",
    dateFormat: "Y-m-d",
  });
}

export { initFlatpickr };

import flatpickr from "flatpickr";
import "flatpickr/dist/themes/dark.css";

const initCalendar = () => {
  const dateFlatpickr = document.querySelector("#date-flatpickr");
  if (dateFlatpickr) {
    flatpickr("#date-flatpickr", {
      disableMobile: true
    });
  }
}

export { initCalendar };

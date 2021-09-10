import { Controller } from "stimulus"
import flatpickr from "flatpickr";


export default class extends Controller {

  static targets = ["form", "times"]

  connect() {
    console.log(this.formTarget);
  }

  addnewtime() {
    this.timesTarget.insertAdjacentHTML('beforeend', `<input type="time" name="schedule[times][]" style="margin-left: 3px" class="datepicker">`)
    this.addFlatpickr()
  }

  removetime() {
    this.timesTarget.lastChild.remove()
  }

  addFlatpickr(){
    flatpickr(".datepicker", {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
      time_24hr: true

    });
  }
}

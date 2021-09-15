import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";


export default class extends Controller {
  static targets = ['meds', 'btn'];

  taken(event) {
    const intakeId = event.currentTarget.dataset.id
    const url = `/intakes/${intakeId}/take`
    fetch(url , {
      method: 'POST',
      headers: { 'X-CSRF-Token': csrfToken() }
    })
      .then(response => {
        if (response.status == 200) {
          this.medsTargets.find(x => x.id === `intake-${intakeId}`).classList.toggle("taken");
          this.btnTargets.find(x => x.dataset.id === `${intakeId}`).innerText = "Med taken"
        }
      })
  }

}

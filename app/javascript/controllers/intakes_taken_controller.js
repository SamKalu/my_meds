import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";


export default class extends Controller {
  static targets = ['meds', 'btn','icon'];

  taken(event) {
    const intakeId = event.currentTarget.dataset.id
    const url = `/intakes/${intakeId}/take`
    fetch(url , {
      method: 'POST',
      headers: { 'X-CSRF-Token': csrfToken() }
    })
      .then(response => {
        const btnHtml = `<i class="fas fa-check-circle mr-2"></i><p>Med taken</p>`;
        const dayTime = this.iconTarget.dataset.name;
        const alert = document.querySelector(`#${dayTime}-alert`);
        if (response.status == 200) {
          this.medsTargets.find(x => x.id === `intake-${intakeId}`).classList.toggle("taken");
          this.btnTargets.find(x => x.dataset.id === `${intakeId}`).innerHTML = btnHtml;
          console.log(this.btnTargets)
          console.log(this.btnTargets.every(x => x.querySelector(".fa-check-circle")))
          if (this.btnTargets.every(x => x.querySelector(".fa-check-circle"))) {
            this.iconTargets[0].innerHTML = '<i class="fas fa-check-circle"></i>'
            alert.classList.add("d-none")
          }
        }
      })
  }

}

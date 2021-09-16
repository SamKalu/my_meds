import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "trigger", "output" ]

  connect() {
  }
  show(event) {
    const elementToShow = this.outputTargets.find( (el) => el.id === event.currentTarget.id )

    if (event.currentTarget.classList.contains("treatment-card-selected")) {
      event.currentTarget.classList.remove("treatment-card-selected");
      elementToShow.classList.add("d-none");
      this.outputTargets[0].classList.remove("d-none");
    } else {
      this.triggerTargets.forEach( (el) => el.classList.remove("treatment-card-selected"))
      const selectedCard = event.currentTarget
      console.log(selectedCard)
      selectedCard.classList.add("treatment-card-selected")

      this.outputTargets.forEach( (el) => el.classList.add("d-none"))
      elementToShow.classList.remove("d-none")
    }
    
  }
}
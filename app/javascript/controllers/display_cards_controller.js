import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "trigger", "output" ]

  connect() {
    console.log(this.triggerTargets)
    console.log(this.outputTargets)
  }
  show(event) {
    this.triggerTargets.forEach( (el) => el.classList.remove("treatment-card-selected"))
    const selectedCard = event.currentTarget
    console.log(selectedCard)
    selectedCard.classList.add("treatment-card-selected")

    this.outputTargets.forEach( (el) => el.classList.add("d-none"))
    const elementToShow = this.outputTargets.find( (el) => el.id === event.currentTarget.id )
    elementToShow.classList.remove("d-none")
  }
}
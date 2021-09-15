import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['restock', 'form'];
  // connect() {
  //    console.log("hello from StimulusJS")
  // }
  displayForm() {
    console.log("hi")
    this.formTarget.classList.toggle('d-none');
    this.restockTarget.classList.toggle('d-none');
  }
}

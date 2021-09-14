import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['meds', 'btn'];

  connect() {
    console.log(this.medsTarget);
    console.log(this.btnTarget);
  }

  taken(event) {
    console.log('TODO: toggle status of intake - taken to true + -1 stock of med');
  }

}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  reset() {
    const clearForm = setTimeout(() => {
        document.getElementById("new_criterium").reset();
        clearInterval(clearForm);
      }, 50);
  }
}

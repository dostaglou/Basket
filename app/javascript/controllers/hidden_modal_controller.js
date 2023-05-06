import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hidden-modal"
export default class extends Controller {
  static targets = ["modal"]
  static classes = ["hidden"]

  toggle() {
    this.modalTarget.classList.toggle(this.hiddenClass)
  }

  outsideClick(event) {
    if(event.target.type == "submit") { return }

    event.preventDefault();

    if (event.target === this.modalTarget) { this.toggle() }
  }
}

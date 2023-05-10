import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal", "submitButton"]

  open(event) { }

  outsideClick(event) {
    if (event.target === this.submitButtonTarget) { return }

    event.preventDefault();

    if (event.target === this.element) { this.close() }
  }
  escClose(event) {
    if (event.key === 'Escape') { this.close() }
  }

  close() {
    this.modalTarget.remove()
  }
}

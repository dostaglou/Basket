import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dialog"
export default class extends Controller {
  static targets = ["dialog", "modalBox", "openButton"]

  open() {
    this.dialogTarget.showModal()
  }

  close() {
    this.dialogTarget.close()
  }

  outsideClick(event) {
    let clickedOpen = this.openButtonTarget.contains(event.target) || this.openButtonTarget === event.target

    if (clickedOpen) { return }

    let inside = this.modalBoxTarget.contains(event.target) || this.modalBoxTarget === event.target

    if (!inside) { this.close() }
  }
}

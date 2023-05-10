import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display"
export default class extends Controller {
  static targets = ["section"]
  static classes = ["hidden"]

  toggle() {
    this.sectionTarget.classList.toggle(this.hiddenClass)
  }
}

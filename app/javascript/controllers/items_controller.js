import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="items"
export default class extends Controller {
  connect() {}

  increment(e) {
    e.preventDefault()
    const csrfToken = document.querySelector("[name='csrf-token']").content
    const typicalQuantity = e.target.dataset.typicalQuantity
    const id = e.target.dataset.id
    const url = e.target.dataset.url
    const req = {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': csrfToken,
        'Accept': 'text/vnd.turbo-stream.html, text/html'
      },
      body: JSON.stringify({ item: { typical_quantity: Number(typicalQuantity) + 1 } })
    }
    fetch(url, req)
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}

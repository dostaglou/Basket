import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="basket-items"
export default class extends Controller {
  connect() {}

  toggleStatus(e) {
    e.preventDefault()
    const csrfToken = document.querySelector("[name='csrf-token']").content
    const status = e.params.status
    const url = e.params.url
    const req = {
      method: 'PATCH',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': csrfToken,
        'Accept': 'text/vnd.turbo-stream.html, text/html'
      },
      body: JSON.stringify({ basket_item: { status: status } })
    }
    fetch(url, req)
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}

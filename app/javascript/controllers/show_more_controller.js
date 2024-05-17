import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['content', 'control']

  connect() {
    this.showLess();
  }

  showLess() {
    this.contentTarget.classList.add('shrunken')
    this.controlTarget.classList.remove('hidden')
  }

  showMore() {
    this.contentTarget.classList.remove('shrunken')
    this.controlTarget.classList.add('hidden')
  }
}

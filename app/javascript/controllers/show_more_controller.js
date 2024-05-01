import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['content', 'control']

  showMore() {
    this.contentTarget.classList.remove('shrunken')
    this.controlTarget.classList.add('hidden')
  }
}

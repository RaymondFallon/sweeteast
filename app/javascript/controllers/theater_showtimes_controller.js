import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['button']
  static values = { code: String, isHidden: Boolean }

  get hiddenTokenName() {
    return `${this.codeValue}-hidden`
  }

  connect() {
    this.isHiddenValue = localStorage.getItem(this.hiddenTokenName) === "true"
    this.setVisibility()
  }

  toggle() {
    this.isHiddenValue = !this.isHiddenValue
    localStorage.setItem(this.hiddenTokenName, this.isHiddenValue)
    this.setVisibility()
  }

  // Private

  setVisibility() {
    this.element.classList.toggle('hidden-section', this.isHiddenValue)
    this.buttonTarget.textContent = this.isHiddenValue ? 'Show' : 'Hide'
  }
}

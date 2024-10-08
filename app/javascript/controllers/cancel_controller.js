import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['form'];

  showForm() {
    this.formTarget.classList.toggle('hidden');
  }
}

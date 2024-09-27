import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['quantityField'];

  increment() {
    this.quantityFieldTarget.value =
      parseInt(this.quantityFieldTarget.value) + 1;
  }

  decrement() {
    if (this.quantityFieldTarget.value > 1) {
      this.quantityFieldTarget.value =
        parseInt(this.quantityFieldTarget.value) - 1;
    }
  }
}

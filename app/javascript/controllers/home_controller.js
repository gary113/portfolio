import { Controller } from "@hotwired/stimulus";
import Typed from 'typed.js';

// Connects to data-controller="home"
export default class extends Controller {
  static targets = ["homeContainer"]

  connect() {
    this.init_typed();
  }

  init_typed() {
    const options = {
      stringsElement: '#typed-strings',
      typeSpeed: 50,
      backSpeed: 50,
      loop: true
    };

    new Typed("#typed", options);
  }
}

import { Controller } from "@hotwired/stimulus";
import Typed from 'typed.js';
import 'vanta/dist/vanta.net.min.js';
import THREE from "vanta/vendor/three.r134.min.js";
import p5 from 'vanta/vendor/p5.min.js';

// Connects to data-controller="home"
export default class extends Controller {
  static targets = ["homeContainer", "backgroundContainer"]

  connect() {
    document.addEventListener('turbo:render', () => {
      this.backgroundContainerTarget.classList.add('fadeIn');
    });

    this.vanta = this.init_vanta();
    this.init_typed();
  }

  disconnect() {
    this.vanta?.destroy();
  }

  init_vanta() {
    return VANTA.NET({
      el: this.backgroundContainerTarget,
      scale: 1,
      THREE: THREE,
      p5: p5,
      scaleMobile: 0.5,
      color: 'gray',
      backgroundColor: '#212529'
    })
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

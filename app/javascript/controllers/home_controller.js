import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';

// Connects to data-controller="home"
export default class extends Controller {
  static targets = ["homeContainer"]
  connect() {
    this.init_typed();
    this.init_cursor_efect();
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

  init_cursor_efect() {
    const containerElement = this.homeContainerTarget,
      windowWidthFifth = window.innerWidth / 5,
      windowHeightFifth = window.innerHeight / 5;

    containerElement.addEventListener("mousemove", function (mouseEvent) {
      const mouseXPosition = mouseEvent.clientX / windowWidthFifth,
        mouseYPosition = mouseEvent.clientY / windowHeightFifth;
      containerElement.style.transform =
        "translate3d(-" + 1.5 * mouseXPosition + "px, -" + 1.5 * mouseYPosition + "px, 0)";
    });
  }
}

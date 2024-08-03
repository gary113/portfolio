import { Controller } from "@hotwired/stimulus";
import 'vanta/dist/vanta.net.min.js';
import THREE from "vanta/vendor/three.r134.min.js";
import p5 from 'vanta/vendor/p5.min.js';

// Connects to data-controller="application"
export default class extends Controller {
  static targets = ["navLink", "backgroundContainer"];

  connect() {
    // if (document.documentElement.hasAttribute('data-turbo-preview')) {
    //   return;
    // }

    this.vanta = this.init_vanta();
    this.pages = this.navLinkTargets.map((navLink) => navLink.getAttribute('href'));
    this.currentPageIndex = this.pages.indexOf(window.location.pathname);
    this.currentPageIndex = this.currentPageIndex === -1 ? 0 : this.currentPageIndex;

    document.addEventListener('turbo:request-start', function () {
      this.backgroundContainerTarget.classList.add('fadeIn');
    });

    document.addEventListener('turbo:render', () => {
      const mainContainer = document.querySelector('#main-container');

      this.backgroundContainerTarget.classList.add('fadeIn');

      if (this.currentPageIndex !== undefined && this.newPageIndex !== undefined) {
        if (this.currentPageIndex < this.newPageIndex) {
          mainContainer.classList.remove('slideToNext');
          mainContainer.classList.add('slideToPrevious');
        } else if (this.currentPageIndex > this.newPageIndex) {
          mainContainer.classList.remove('slideToPrevious');
          mainContainer.classList.add('slideToNext');
        } else {
          mainContainer.classList.remove('slideToNext');
          mainContainer.classList.remove('slideToPrevious');
        }

        this.currentPageIndex = this.newPageIndex;
        this.newPageIndex = undefined;
      }
    });
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
      color: 'red',
      backgroundColor: '#212529'
    })
  }

  updateNewPageIndex(event) {
    this.newPageIndex = this.pages.indexOf(event.currentTarget.getAttribute('href'));
    this.newPageIndex = this.newPageIndex === -1 ? 0 : this.newPageIndex;
  }
}

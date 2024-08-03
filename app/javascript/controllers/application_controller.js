import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="application"
export default class extends Controller {
  static targets = ["navLink"];

  connect() {
    // if (document.documentElement.hasAttribute('data-turbo-preview')) {
    //   return;
    // }

    this.pages = this.navLinkTargets.map((navLink) => navLink.getAttribute('href'));
    this.currentPageIndex = this.pages.indexOf(window.location.pathname);
    this.currentPageIndex = this.currentPageIndex === -1 ? 0 : this.currentPageIndex;

    document.addEventListener('turbo:render', () => {
      const mainContainer = document.querySelector('#main-container');

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

  updateNewPageIndex(event) {
    this.newPageIndex = this.pages.indexOf(event.currentTarget.getAttribute('href'));
    this.newPageIndex = this.newPageIndex === -1 ? 0 : this.newPageIndex;
  }
}

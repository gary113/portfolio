import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-modal"
export default class extends Controller {
  static targets = ["imageContainer", "imageLink"];

  connect() {
  }

  load_image(event) {
    const projectImageUrl = event.currentTarget.dataset.projectImageUrl;

    this.imageContainerTarget.src = projectImageUrl;
    this.imageLinkTarget.href = projectImageUrl;
  }
}

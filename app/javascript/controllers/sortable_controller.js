import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs';

// Connects to data-controller="sortable"
export default class extends Controller {
  static targets = ["tableBody"];
  static values = {
    reorderUrl: String
  }

  connect() {
    this.init_sortable();
  }

  init_sortable(){
    const tableBody = this.tableBodyTarget;

    new Sortable(tableBody, {
      animation: 150,
      handle: '.handle',
      onEnd: (e) => {
        const order = Array.from(e.target.children).map((row, index) => ({ id: row.dataset.id, position: index + 1 }));

        fetch(this.reorderUrlValue, {
          method: 'PATCH',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
          },
          body: JSON.stringify({ order })
        });
      },
    });
  }
}

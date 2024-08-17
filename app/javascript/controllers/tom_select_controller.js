import { Controller } from "@hotwired/stimulus"
import TomSelect from 'tom-select/dist/js/tom-select.complete.min';

// Connects to data-controller="tom-select"
export default class extends Controller {
  static targets = ["select"];

  connect() {
    this.selectTargets.forEach((select) => {
      new TomSelect(select, {
        allowEmptyOption: true,
        sortField: {
          field: "text",
          direction: "asc"
        },
        plugins: {
          remove_button: {
            title: 'Eliminar'
          },
          clear_button: {
            'title': 'Limpiar'
          }
        }
      });

    });
  }
}

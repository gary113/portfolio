// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import * as bootstrap from "bootstrap";
import "trix";
import "@rails/actiontext";

import { trixTranslation } from "../../config/locales/trix_es.json";

document.addEventListener("trix-before-initialize", () => {
  Object.assign(Trix.config.lang, trixTranslation);
});

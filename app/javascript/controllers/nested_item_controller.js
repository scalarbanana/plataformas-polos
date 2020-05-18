import {Controller} from "stimulus"

export default class extends Controller {
    static targets = ["deleteField", "fileName"];

    markForDeletion(ev) {
        ev.preventDefault();
        if (this.data.has('persisted')) {
            this.deleteFieldTarget.value = true;
            this.element.style.display = 'none';
        } else {
            this.element.remove();
        }
    }

    updateFileName(ev) {
        const file = ev.target.files && ev.target.files[0];
        if (file) {
            this.fileNameTarget.textContent = file.name;
        }
    }

}
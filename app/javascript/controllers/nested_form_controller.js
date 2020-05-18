import {Controller} from "stimulus"

export default class extends Controller {
    static targets = ["template", "list"];
    template;

    connect() {
        this.template = this.templateTarget.innerHTML;
    }

    add_association(ev) {
        ev.preventDefault();
        const newItem = this.template.replace(/TEMPLATE/g, new Date().valueOf());
        this.listTarget.insertAdjacentHTML("beforeend", newItem);
    }

}
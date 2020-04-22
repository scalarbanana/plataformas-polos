import {Controller} from "stimulus"

export default class extends Controller {
    connect() {
        this.element.querySelector('.card-header').addEventListener('click', this.toggle);
        if (this.data.get("default") === 'closed') {
            this.toggle();
        }
    }

    toggle = () => {
        const newDisplay = this.element.querySelector(':scope > .card-content, :scope > .card-image').style.display === 'none' ? 'block' : 'none';
        this.element.querySelectorAll(':scope > .card-content, :scope > .card-image')
            .forEach((el) => el.style.display = newDisplay);
    }
}
import { Controller } from "stimulus"

export default class extends Controller {
    close(event) {
        this.element.remove()
    }
}
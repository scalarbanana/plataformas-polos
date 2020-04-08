import { Controller } from "stimulus"

export default class extends Controller {
    close(event) {
        console.log("teste")
        this.element.remove()
    }
}
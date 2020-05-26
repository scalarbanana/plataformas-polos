import {Controller} from "stimulus"

export default class extends Controller {
    static targets = ["dashboard", "users", "tecitura", "cartografia"];

    connect() {
        this[`${this.data.get("currentPath")}Target`].className = "is-active"
    }
}
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("this is visibility controller")
    }
    static targets = ["navMenu", "mobileMenu"]

    toggle() {
        this.navMenuTarget.classList.toggle("hidden")
    }

    mobileToggle() {
        this.mobileMenuTarget.classList.toggle("hidden")
    }
}
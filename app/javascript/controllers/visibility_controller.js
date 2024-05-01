import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("this is visibility controller")
    }
    static targets = ["navMenu", "mobileMenu", "workspaceForm"]

    toggle() {
        this.navMenuTarget.classList.toggle("hidden")
    }

    mobileToggle() {
        this.mobileMenuTarget.classList.toggle("hidden")
    }

    workspaceFormToggle() {
        this.workspaceFormTarget.classList.toggle("hidden")
    }
}
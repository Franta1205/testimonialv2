import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("this is visibility controller")
    }
    static targets = ["navMenu", "mobileMenu", "workspaceForm", "password", "pwIcon"]

    toggle() {
        this.navMenuTarget.classList.toggle("hidden")
    }

    mobileToggle() {
        this.mobileMenuTarget.classList.toggle("hidden")
    }

    workspaceFormToggle() {
        this.workspaceFormTarget.classList.toggle("hidden")
    }

    toggleVisibilityPassword() {
        const pwField = this.passwordTarget;
        const pwIcon = this.pwIconTarget;

        // Toggle the type attribute of the password field
        pwField.type = pwField.type === 'password' ? 'text' : 'password';

        // Toggle the opacity of the icon
        pwIcon.style.opacity = pwIcon.style.opacity === '0.5' ? '1' : '0.5';
    }

    toggleFleshMessages(){
        this.element.classList.toggle('hidden');
    }
}
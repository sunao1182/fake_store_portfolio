import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus"

// Import Bootstrap JavaScript
import "bootstrap"

// Initialize Stimulus
const application = Application.start()

// Load Stimulus controllers
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

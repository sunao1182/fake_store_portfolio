# config/importmap.rb

# Pin npm packages by running ./bin/importmap
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
# rails7のbootstrapに必須。
pin "bootstrap" # @5.3.3
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8

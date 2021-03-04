import Rails from "@rails/ujs"
import "bootstrap"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("./nested-forms/addFields")
require("./nested-forms/removeFields")

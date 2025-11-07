variable "logout" {
    type = list(string)
}

variable "support_email" {
    type = string
}

variable "support_url" {
    type = string
}

variable "session_lifetime" { # Default duration is 8 hour window
    type = number
    default = 2
}

variable "idle_session_lifetime" { # Default of 2 hour idle duration
    type = number
    default = 2
}
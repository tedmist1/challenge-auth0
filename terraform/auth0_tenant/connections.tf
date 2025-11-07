# For simplicity, only enabling email. Realistically, would want other auth0_connection blocks that include SMS and others, but outside scope of the project.
resource "auth0_connection" "passwordless-email" {
    strategy = "email"
    name = "email"
    
    options {
        name                     = "email"
        from                     = "{{ application.name }} \u003croot@auth0.com\u003e"
        subject                  = "Welcome to {{ application.name }}"
        syntax                   = "liquid"
        template                 = "<html>Please login using this passwordless email.</html>"
        disable_signup           = false
        brute_force_protection   = true
        non_persistent_attrs     = []
        auth_params = {
        scope         = "openid email profile offline_access"
        response_type = "code"
        }

        totp {
        time_step = 300
        length    = 6
        }

        password_policy = "excellent"
    }
}

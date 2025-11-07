resource "auth0_tenant" "tenant"{
    allowed_logout_urls = var.logout

    support_email = var.support_email
    support_url = var.support_url
    default_directory = "Username-Password-Authentication" # TODO Lookup more details on this
    sandbox_version = "22" # TODO lookup most up to date version. Might want to throw this in a variable though and just have a default value

    flags { # TODO lookup more flags and verify these should be set.
        # universal_login = true  
        enable_pipeline2 = true
        enable_apis_section = true
        enable_client_connections = false
        # change_password_flow_v1 = false
        mfa_show_factor_list_on_enrollment = true
    }

    session_lifetime = var.session_lifetime
    idle_session_lifetime = var.idle_session_lifetime

    session_cookie {
        mode = "non-persistent" # TODO potentially modify
    }

    
}
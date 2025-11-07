resource "auth0_tenant" "tenant"{
    allowed_logout_urls = var.logout

    support_email = var.support_email
    support_url = var.support_url
    default_directory = "email" # Sets the default login type to email, which matches the passwordless setup we're using.
    sandbox_version = "22" # 22 is the most up to date version

    # Flags could be further explored, potentially more settings that would be good to enable
    flags { 
        enable_pipeline2 = true
        enable_apis_section = true
        enable_client_connections = false
        mfa_show_factor_list_on_enrollment = true
    }

    # These could be coded as variables in a production environment for more flexibility but hardcoded in this case
    session_lifetime = 8
    idle_session_lifetime = 2

    session_cookie {
        mode = "non-persistent" 
    }
    
}
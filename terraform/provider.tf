terraform{
    required_providers {
        auth0 = {
            source = "auth0/auth0"
            version = "~> 1.0"
        }
    }
    required_version = ">= 1.5.0"
}

# Environment variables required: AUTH0_DOMAIN, AUTH0_CLIENT_ID, AUTH0_CLIENT_SECRET, AUTH0_DEBUG
provider "auth0" {}
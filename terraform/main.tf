module "auth0_tenant" {
    source = "./auth0_tenant"

    providers = {
        auth0 = auth0
    }

    support_email = var.support_email
    support_url = var.support_url
    logout = var.logout
}
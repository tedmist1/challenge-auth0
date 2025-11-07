# Enabling Auth0 guardian. Hard coded default values, allowing users the choice between email, otp, phone, and recovery codes.
resource "auth0_guardian" "guardian" {
   policy = "all-applications" # Requires sign in with MFA every time
   email = true
   otp = true
   phone {
    enabled = true
    message_types = ["sms", "voice"]
    provider = "auth0"
   }
   recovery_code = true
}
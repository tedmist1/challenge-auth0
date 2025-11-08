# challenge-auth0
Tyler Edmiston's repository for code challenge. Two week take home interview for Teleport, Security-Automation L3.

For the project proposal, see [here.](design-document.md)

This README will be updated with details and instructions as the project is developed.

Below are some assumptions/notes, beyond what's detailed in the design document.


## Hard coded Variables

Many specifics are hard coded values within the modules. When creating a module, typically it would be designed to be as flexible as possible. However, the scope of this project does not require the flexibility of all variables. Therefore, I decided it would be appropriate to hard code any of the values that I would have created a "default". Hard coded values that should be variabilized include: flags, session lifetimes, session cookie modes, default directory, and sandbox version.


## MFA
Auth0_Guardian, Auth0's default way of attaching MFA to a tenant, is disabled for new tenants. As of now, MFA is not enforced, but passwordless logins are used to help maintain secure logins. If time permits, I will explore the idea of hitting the API endpoint manually with a null-resource to enable MFA on the tenant.


## Login Methods
The only currently supported way to login is passwordless, sent via email. For a project of any scale, other secure login methods should be included, but for simplicity just the single login method is being used.

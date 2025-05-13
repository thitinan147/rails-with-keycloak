# Rails with Keycloak Integration

This repository demonstrates a Rails application integrated with Keycloak authentication without using specialized gems. It provides a template for connecting your Rails application directly with Keycloak's authentication services.

## Authentication Flow

The integration follows the OAuth 2.0 Authorization Code flow:

![Keycloak Authentication Flow](https://github.com/user-attachments/assets/IMAGE_ID_PLACEHOLDER)

1. User requests a protected resource from your Rails app
2. App redirects the user to Keycloak for authentication
3. User is presented with Keycloak login page
4. User submits login credentials to Keycloak
5. Keycloak redirects back to your app with an authorization code
6. Your Rails app exchanges the code for access and ID tokens
7. App uses these tokens to authenticate the user

## References
- [Keycloak Official Website](https://www.keycloak.org/)
- [Keycloak and Authorization Code Flow](https://embriq.no/en/news/keycloak-and-authorization-code-flow/)

## Getting Started

### Prerequisites

- Docker and Docker Compose
- Git
- Ruby on Rails environment

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/thitinan147/rails-with-keycloak.git
   ```

2. Switch to the integration branch:
   ```bash
   cd rails-with-keycloak
   git switch login-with-keycloak-without-using-gem
   ```

3. Start the application and Keycloak:
   ```bash
   docker-compose up
   ```

   When you're done:
   ```bash
   docker-compose down
   ```

## Keycloak Configuration

### 1. Create a Realm

1. Access Keycloak at http://localhost:8080
2. Go to "Administration Console"
3. Navigate to "Manage realm" → "Create realm"
4. Enter a name for your realm (e.g., "myrealm")

   ![Create Realm](https://github.com/user-attachments/assets/be89d430-321b-4fa9-944c-6da11df7247b)

### 2. Create a Client

1. In your realm, navigate to "Clients" → "Create client"

   ![Create Client](https://github.com/user-attachments/assets/233b452e-bc9b-4aec-8a60-cfe5dd3fee62)

2. Enable "Client authentication" and "Authorization"

   ![Client Settings](https://github.com/user-attachments/assets/5b295793-21fa-499e-8308-1199d7761d14)

3. Configure client access:
   - Root URL: `http://localhost:3000`
   - Valid post logout redirect URLs: `http://localhost:3000/auth/callback`

   ![Client URLs](https://github.com/user-attachments/assets/d9f6ce56-037b-4238-8a50-dc1993be8b24)

### 3. Create a User

1. Go to "Users" → "Add user"

   ![Add User](https://github.com/user-attachments/assets/f2d6d313-d349-491f-a118-9092e2714796)

2. Set the user's credentials:
   - Navigate to "Credentials" tab
   - Set a password for the user

   ![Set Password](https://github.com/user-attachments/assets/6e2edead-c202-400c-ae16-6af3e5ea5c7f)

## Application Configuration

Update the following files with your Keycloak details:

### 1. Sessions Controller

In `app/controllers/sessions_controller.rb`:
- Replace `myrealm` with your realm name

   ![Sessions Controller Realm](https://github.com/user-attachments/assets/8e0bd1ee-d12b-4005-a5e4-03d2a8322000)

- Replace `myclient` with your client ID

   ![Sessions Controller Client](https://github.com/user-attachments/assets/8c284021-7a39-45cd-887b-fda3646bfed5)

### 2. Keycloak Service

In `app/services/keycloak_service.rb`:
- Replace `myrealm` with your realm name

   ![Keycloak Service Realm](https://github.com/user-attachments/assets/933a2c0f-52e9-4fb1-9343-fb55a49cfe02)

- Replace `myclient` with your client ID

   ![Keycloak Service Client](https://github.com/user-attachments/assets/6567c677-f73d-41f3-a4ca-b17aca634564)

- Replace `client_secret` with your client secret found in Keycloak's admin console:
  - Navigate to your client in Keycloak
  - Go to "Credentials" tab
  - Copy the "Client secret"

   ![Client Secret Location](https://github.com/user-attachments/assets/8456600e-086c-44e5-88b6-ca7c0867eed6)
   
   ![Client Secret Example](https://github.com/user-attachments/assets/1b3620f6-fd83-4d7d-b4cb-005e27b0b1dd)

## Testing the Integration

1. Access your Rails application at http://localhost:3000
2. Click the login button
3. Enter the username and password of the user you created in Keycloak

   ![Login Screen](https://github.com/user-attachments/assets/048ae0e0-c4f9-4aa1-a4dd-f84c0cf42823)

4. Upon successful login, you'll see the application's protected page:

   ![Successful Login](https://github.com/user-attachments/assets/0412138d-1462-42af-82da-503b3e34a9dc)

5. Test the logout functionality

## Further Development

For deeper integration or customization, you can explore the codebase to understand how:
- Authentication requests are sent to Keycloak
- Tokens are processed and validated
- Sessions are managed in the Rails application

## Notes

The main branch contains a TDD (Test-Driven Development) approach, while this branch (`login-with-keycloak-without-using-gem`) focuses on a direct integration with Keycloak without relying on specialized gems.

## Acknowledgments

Special thanks to [Claude.ai](https://claude.ai) for assistance with creating this README documentation.

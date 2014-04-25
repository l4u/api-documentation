---
title: OAuth | Dribbble API
---

# OAuth

* TOC
{:toc}

OAuth2 is a protocol that lets external applications request authorization to
private details in a user's Dribbble account without getting their password.
This is preferred over Basic Authentication because tokens can be limited to
specific types of data, and can be revoked by users at any time.

All developers need to [register their
application](https://dribbble.com/account/applications/new) before getting
started. A registered OAuth application is assigned a unique client ID and
client secret.  The client secret should not be shared.

## Web Application Flow

### 1. Redirect users to request Dribbble access.

    GET https://dribbble.com/oauth/authorize

### Parameters

| Name | Type | Description |
|------|------|-------------|
| `client_id` | `string` | **Required.** The client ID you received from Dribbble when you [registered](https://dribbble.com/account/applications/new). |
| `redirect_uri` | `string` | The URL in your application where users will be sent after authorization. See details below about [Redirect URLs](#redirect-urls). |
| `scope` | `string` | A space separated list of [scopes](#scopes). If not provided, scope defaults to the `public` scope for users that don't have a valid token for the application. For users who do already have a valid token for the application, the user won't be shown the authorization page with the list of scopes. Instead, this step of the flow will automatically complete with the same scopes that were user last time the user completed the flow. |
| `state` | `string` | An unguessable random string. It is used to protect against cross-site request forgery attacks. |

### 2. Dribbble redirects back to your site.

If the user accepts your request, Dribbble redirects back to your site with a
temporary code in a `code` parameter as well as the state you provided in the
previous step in a `state` parameter. If the states don't match, the request has
been created by a third party and the process should be aborted.

Exchange this for an access token:

    POST https://dribbble.com/oauth/token

### Parameters

| Name | Type | Description |
|------|------|-------------|
| `client_id` | `string` | **Required.** The client ID you received from Dribbble when you [registered](https://dribbble.com/account/applications/new). |
| `client_secret` | `string` | **Required.** The client secret you received from Dribbble when you [registered](https://dribbble.com/account/applications/new). |
| `code` | `string` | **Required.** The code you received as a response to [Step 1](#redirect-users-to-request-dribbble-access). |
| `redirect_uri` | `string` | The URL in your application where users will be sent after authorization. See details below about [Redirect URLs](#redirect-urls). |

### Response

The response will be returned as JSON and takes the following form:

<%= json access_token: "29ed478ab86c07f1c069b1af76088f7431396b7c4a2523d06911345da82224a0",
         token_type: "bearer",
         scope: "public write",
         expires_in: 31557600 %>

### 3. Use the access token to access the API.

The access token allows you to make requests to the API on a behalf of a user.

    GET https://api.dribbble.com/v1/user?access_token=...

You can pass the token in the query parameters like shown above, but a cleaner
approach is to include it in the Authorization header:

    Authorization: Bearer ACCESS_TOKEN

For example, in curl you can set the Authorization header like this:

    curl -H "Authorization: Bearer ACCESS_TOKEN" https://api.dribbble.com/v1/user

## Non-Web Application Flow

We currently do not support any other authentication methods besides OAuth.

## Redirect URLs

The `redirect_uri` parameter is optional. If left out, Dribbble will redirect
users to the callback URL configured in the OAuth application settings. If
provided, the redirect URL's host and port must exactly match the callback URL.
The redirect URL's path must reference a subdirectory of the callback URL.

    CALLBACK: http://example.com/path

    GOOD: http://example.com/path
    GOOD: http://example.com/path/subdir/other
    BAD:  http://example.com/
    BAD:  http://example.com/bar
    BAD:  http://example.com:8080/path
    BAD:  http://oauth.example.com:8080/path
    BAD:  http://example.org

## Scopes

Scopes let you specify exactly what type of access you need. Scopes limit access
for OAuth tokens. They do not grant any additional permission beyond that which
the user already has.

For the web flow, requested scopes will be displayed to the user on the
authorize form.

| Name | Description |
|------|-------------|
| `public` | Grants read-only access to public information. <span class="note">This is the default scope if no scope is provided.</span> |
| `write` | Grants write access to user resources, such as following, liking, and commenting. |

Your application can request the scopes in the initial redirection. You can
specify multiple scopes by separating them with a space:

    https://dribbble.com/oauth/authorize?
      client_id=...&
      scope=public+write

## Common errors for the authorization request

There are a few things that can go wrong in the process of obtaining an OAuth
token for a user. In the initial authorization request phase, these are some
errors you might see:

### Application Suspended

If the OAuth application you set up has been suspended (due to reported abuse,
spam, or a mis-use of the API), Dribbble will redirect to the registered
callback URL with the following parameters summarizing the error:

    http://your-application.com/callback?error=application_suspended
      &error_description=Your+application+has+been+suspended.
      &state=xyz

Please [contact support](http://dribbble.com/contact?api) to solve issues with
suspended applications.

### Redirect URI Mismatch

If you provide a redirect_uri that doesn't match what you've registered with
your application, Dribbble will redirect to the registered callback URL with the
following parameters summarizing the error:

    http://your-application.com/callback?error=invalid_redirect_uri
      &error_description=The+redirect+uri+included+is+not+valid.
      &state=xyz

To correct this error, either provide a redirect_uri that matches what you
registered or leave out this parameter to use the default one registered with
your application.

### Access Denied

If the user rejects access to your application, Dribbble will redirect to the
registered callback URL with the following parameters summarizing the error:

    http://your-application.com/callback?error=access_denied
      &error_description=The+resource+owner+or+authorization+server+denied+the+request.
      &state=xyz

There's nothing you can do here as users are free to choose not to use your
application. More often than not, users will just close the window or press back
in their browser, so it is likely that you'll never see this error.

## Common errors for the access token request

In the second phase of exchanging a code for an access token, there are an
additional set of errors that can occur.

### Incorrect Client Credentials

If the client_id and or client_secret you pass are incorrect you will receive
this error response.

<%= json error: "invalid_client",
         error_description: "Client authentication failed due to unknown client, no client authentication included, or unsupported authentication method." %>

To solve this error, go back and make sure you have the correct credentials for
your OAuth application. Double check the client_id and client_secret to make
sure they are correct and being passed correctly to Dribbble.

### Redirect URI Mismatch

If you provide a redirect_uri that doesn't match what you've registered with
your application, you will receive this error message:

<%= json error: "invalid_grant",
         error_description: "The provided authorization grant is invalid, expired, revoked, does not match the redirection URI used in the authorization request, or was issued to another client." %>

To correct this error, either provide a redirect_uri that matches what you
registered or leave out this parameter to use the default one registered with
your application.

### Bad Verification Code

If the verification code you pass is incorrect, expired, or doesn't match what
you received in the first request for authorization you will receive this error.

<%= json error: "invalid_grant",
         error_description: "The provided authorization grant is invalid, expired, revoked, does not match the redirection URI used in the authorization request, or was issued to another client." %>

To solve this error, [start the OAuth process over from the
beginning](#redirect-users-to-request-dribbble-access) and get a
new code.

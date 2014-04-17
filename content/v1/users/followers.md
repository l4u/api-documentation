---
title: Users - Followers | Dribbble API
---

# Followers

* TOC
{:toc}

## List followers of a user

List a user's followers:

    GET /users/:user/followers

List the authenticated user's followers:

    GET /user/followers

### Response

<%= headers 200 %>
<%= json(:user) { |hash| [hash] } %>

## List users followed by a user

List who a user is following:

    GET /users/:user/following

List who the authenticated user is following:

    GET /user/following

### Response

<%= headers 200 %>
<%= json(:user) { |hash| [hash] } %>

## Check if you are following a user

    GET /user/following/:user

### Response, if you are following this user

<%= headers 204 %>

### Response, if you are not following this user

<%= headers 404 %>

## Check if one user is following another

    GET /users/:user/following/:target_user

### Response, if user follows target user

<%= headers 204 %>

### Response, if user does not follow target user

<%= headers 404 %>

## Follow a user

    PUT /users/:user/follow

Following a user requires the user to be logged in and authenticated with the
`write` scope.

### Response, if the user was followed

<%= headers 204 %>

### Response, if the user was not able to be followed

<%= headers 422 %>
<%= json message: "You cannot follow yourself." %>

The following errors are possible reasons:

* You cannot follow yourself.
* You have been blocked from following this member at their request.
* You have reached the maximum number of follows allowed.

## Unfollow a user

    DELETE /users/:user/follow

Unfollowing a user requires the user to be logged in and authenticated with the
`write` scope.

<%= headers 204 %>

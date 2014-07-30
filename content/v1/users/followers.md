---
title: Users - Followers
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
<%= json(:following_with_follower) { |hash| [hash] } %>

## List users followed by a user

List who a user is following:

    GET /users/:user/following

List who the authenticated user is following:

    GET /user/following

### Response

<%= headers 200 %>
<%= json(:following_with_followee) { |hash| [hash] } %>

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

Following a user requires the user to be authenticated with the `write` scope.

### Response

<%= headers 204 %>

The following errors are possible, and will be on the `base` attribute:

* You cannot follow yourself.
* You have been blocked from following this member at their request.
* You have reached the maximum number of follows allowed.

## Unfollow a user

    DELETE /users/:user/follow

Unfollowing a user requires the user to be authenticated with the `write` scope.

<%= headers 204 %>

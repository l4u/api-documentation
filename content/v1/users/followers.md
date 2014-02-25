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


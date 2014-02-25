---
title: Users | Dribbble API
---

# Users

* TOC
{:toc}

## Get a single user

    GET /users/:user

### Response

<%= headers 200 %>
<%= json :user %>

## Get the authenticated user

    GET /user

### Response

<%= headers 200 %>
<%= json :user %>

---
title: Users - Likes | Dribbble API
---

# Likes

* TOC
{:toc}

## List likes for a user

List a user's likes:

    GET /users/:user/likes

List the authenticated user's likes:

    GET /user/likes

### Response

<%= headers 200 %>
<%= json(:like) { |hash| [hash] } %>

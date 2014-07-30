---
title: Users - Likes
---

# Likes

* TOC
{:toc}

## List shot likes for a user

List a user's shot likes:

    GET /users/:user/likes

List the authenticated user's shot likes:

    GET /user/likes

### Response

<%= headers 200 %>
<%= json(:like_with_shot) { |hash| [hash] } %>

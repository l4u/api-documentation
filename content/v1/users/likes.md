---
title: Users - Likes | Dribbble API
---

# Likes

* TOC
{:toc}

## List shot likes for a user

List shots a user likes:

    GET /users/:user/likes

List shot likes for the authenticated:

    GET /user/likes

### Response

<%= headers 200 %>
<%= json(:like_for_user) { |hash| [hash] } %>

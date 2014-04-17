---
title: Users - Likes | Dribbble API
---

# Likes

* TOC
{:toc}

## List shots a user likes

List shots a user likes:

    GET /users/:user/likes

List shots the authenticated user likes:

    GET /user/likes

### Response

<%= headers 200 %>
<%= json(:shot) { |hash| [hash] } %>

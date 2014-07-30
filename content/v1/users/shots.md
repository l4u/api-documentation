---
title: Users - Shots
---

# Shots

* TOC
{:toc}

## List shots for a user

List a user's shots:

    GET /users/:user/shots

List the authenticated user's shots:

    GET /user/shots

### Response

<%= headers 200 %>
<%= json(:shot) { |hash| [hash.except(:user)] } %>

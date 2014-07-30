---
title: Teams
---

# Teams

* TOC
{:toc}

## List a user's teams

List a user's teams:

    GET /users/:user/teams

List the authenticated user's teams:

    GET /user/teams

### Response

<%= headers 200 %>
<%= json(:team) { |hash| [hash] } %>

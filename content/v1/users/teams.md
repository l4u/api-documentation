---
title: Users - Teams | Dribbble API
---

# Teams

* TOC
{:toc}

## List teams of a user

List a user's teams:

    GET /users/:user/teams

List the authenticated user's teams:

    GET /user/teams

### Response

<%= headers 200 %>
<%= json(:team) { |hash| [hash] } %>

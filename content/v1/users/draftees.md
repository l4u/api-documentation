---
title: Users - Draftees | Dribbble API
---

# Draftees

* TOC
{:toc}

## List draftees of a user

List a user's draftees:

    GET /users/:user/draftees

List the authenticated user's draftees:

    GET /user/draftees

### Response

<%= headers 200 %>
<%= json(:user) { |hash| [hash] } %>

---
title: Projects
---

# Projects

* TOC
{:toc}

## List a user's projects

List a user's projects:

    GET /users/:user/projects

List the authenticated user's projects:

    GET /user/projects

### Response

<%= headers 200 %>
<%= json(:project) { |hash| [hash] } %>

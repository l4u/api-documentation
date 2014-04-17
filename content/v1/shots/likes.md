---
title: Shots - Likes | Dribbble API
---

# Likes

* TOC
{:toc}

## Like a shot

    PUT /shots/:id/like

Liking a shot requires the user to be logged in and authenticated with the
`write` scope.

### Response, if the shot was liked

<%= headers 204 %>

### Response, if the shot was not able to be liked

<%= headers 422 %>
<%= json message: "You have been blocked from liking shots by this member at their request." %>

## Unike a shot

    DELETE /shots/:id/like

Uniking a shot requires the user to be logged in and authenticated with the
`write` scope.

### Response

<%= headers 204 %>

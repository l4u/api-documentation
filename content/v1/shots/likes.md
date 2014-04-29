---
title: Shots - Likes | Dribbble API
---

# Likes

* TOC
{:toc}

## List users who like a shot

    GET /shots/:id/fans

### Response

<%= headers 200 %>
<%= json(:user) { |hash| [hash] } %>

## Like a shot

    PUT /shots/:id/like

Liking a shot requires the user to be logged in and authenticated with the
`write` scope.

### Response

<%= headers 204 %>

## Unlike a shot

    DELETE /shots/:id/like

Unliking a shot requires the user to be logged in and authenticated with the
`write` scope.

### Response

<%= headers 204 %>

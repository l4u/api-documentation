---
title: Shots - Likes | Dribbble API
---

# Likes

* TOC
{:toc}

## List the likes for a shot

    GET /shots/:id/likes

### Response

<%= headers 200 %>
<%= json(:like) { |hash| [hash] } %>

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

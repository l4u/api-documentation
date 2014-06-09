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
<%= json(:like_with_user) { |hash| [hash] } %>

## Check if you like a shot

    GET /shots/:id/like

### Response, if the user likes the shot

<%= headers 200 %>
<%= json :like %>

### Response, if the user does not like the shot

<%= headers 404 %>

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

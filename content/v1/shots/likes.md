---
title: Shots - Likes
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

Checking for a shot like requires the user to be authenticated.

### Response, if the user likes the shot

<%= headers 200 %>
<%= json :like %>

### Response, if the user does not like the shot

<%= headers 404 %>

## Like a shot

    POST /shots/:id/like

Liking a shot requires the user to be authenticated with the `write` scope.

### Response

<%= headers 201 %>
<%= json :like %>

## Unlike a shot

    DELETE /shots/:id/like

Unliking a shot requires the user to be authenticated with the `write` scope.

### Response

<%= headers 204 %>

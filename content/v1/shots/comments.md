---
title: Shots - Comments | Dribbble API
---

# Comments

* TOC
{:toc}

## List comments for a shot

    GET /shots/:shot/comments

### Response

<%= headers 200 %>
<%= json(:comment) { |hash| [hash] } %>

## List users who like a comment

    GET /shots/:shot/comments/:id/fans

### Response

<%= headers 200 %>
<%= json(:user) { |hash| [hash] } %>

## Like a comment

    PUT /shots/:shot/comments/:id/like

Liking a comment requires the user to be logged in and authenticated with the
`write` scope.

### Response

<%= headers 204 %>

## Unike a comment

    DELETE /shots/:shot/comments/:id/like

Unliking a comment requires the user to be logged in and authenticated with the
`write` scope.

### Response

<%= headers 204 %>

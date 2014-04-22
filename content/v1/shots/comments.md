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

## Create a comment

    POST /shots/:shot/comments

Creating a comment requires the user to be logged in and authenticated with the
`write` scope. Note that mentions are not currently supported.

### Parameters

| Name | Type | Description |
|------|------|-------------|
| `body` | `string` | <strong>Required.</strong> The contents of the comment. |

### Example

<%= json body: COMMENT[:body] %>

### Response

<%= headers 201, Location: "https://api.dribbble.com/v1/shots/471756/comments/3360155" %>
<%= json(:comment) %>

## Get a single comment

    GET /shots/:shot/comments/:id

### Response

<%= headers 200 %>
<%= json(:comment) %>

## Update a comment

    PUT /shots/:shot/comments/:id

Updating a comment requires the user to be logged in and authenticated with the
`write` scope. The authenticated user must also own the comment.

### Response

<%= headers 200 %>
<%= json(:comment) %>

## Delete a comment

    DELETE /shots/:shot/comments/:id

Deleting a comment requires the user to be logged in and authenticated with the
`write` scope. The authenticated user must also own the comment.

### Response

<%= headers 204 %>

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

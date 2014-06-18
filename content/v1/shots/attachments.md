---
title: Shots - Attachments | Dribbble API
---

# Attachments

* TOC
{:toc}

## List attachments for a shot

    GET /shots/:id/attachments

### Response

<%= headers 200 %>
<%= json(:attachment) { |hash| [hash] } %>

## Create an attachment

    POST /shots/:shot/attachments

Creating an attachment requires the user to be authenticated with the `upload`
scope. The authenticated user must also own the shot.

### Parameters

| Name | Type | Description |
|------|------|-------------|
| `file` | `file` | **Required.** The attachment file. |

### Response

<%= headers 201, Location: "https://api.dribbble.com/v1/shots/471756/attachments/73829" %>
<%= json :attachment %>

## Get a single attachment

    GET /shots/:shot/attachments/:id

### Response

<%= headers 200 %>
<%= json :attachment %>

## Delete an attachment

    DELETE /shots/:shot/attachments/:id

Deleting an attachment requires the user to be authenticated with the `upload`
scope. The authenticated user must also own the attachment.

### Response

<%= headers 204 %>

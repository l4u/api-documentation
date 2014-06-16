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

## Delete an attachment

    DELETE /shots/:shot/attachments/:id

Deleting an attachment requires the user to be authenticated with the `upload`
scope.  The authenticated user must also own the attachment.

### Response

<%= headers 204 %>

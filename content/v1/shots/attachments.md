---
title: Shots - Attachments | Dribbble API
---

# Attachments

* TOC
{:toc}

## Delete an attachment

    DELETE /shots/:shot/attachments/:id

Deleting an attachment requires the user to be authenticated with the `upload`
scope.  The authenticated user must also own the attachment.

### Response

<%= headers 204 %>

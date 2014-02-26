---
title: Buckets | Dribbble API
---

# Buckets

* TOC
{:toc}

## Get a bucket

    GET /buckets/:id

### Response

<%= headers 200 %>
<%= json :bucket %>

## List user buckets

List a user's buckets:

    GET /users/:user/buckets

List the authenticated user's buckets:

    GET /user/buckets

### Response

<%= headers 200 %>
<%= json(:bucket) { |hash| [hash] } %>

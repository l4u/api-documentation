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

## Create a bucket

    POST /buckets

Creating a bucket requires the user to be authenticated with the `write` scope.

### Parameters

| Name | Type | Description |
|------|------|-------------|
| `name` | `string` | **Required.** The name of the bucket. |
| `description` | `string` | A description of the bucket. |

### Example

<%= json name: BUCKET[:name], description: BUCKET[:description] %>

### Response

<%= headers 201, Location: "https://api.dribbble.com/v1/buckets/2754" %>
<%= json(:bucket) %>

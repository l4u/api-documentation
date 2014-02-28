---
title: Shots - Buckets | Dribbble API
---

# Buckets

* TOC
{:toc}

## List buckets for a shot

    GET /shots/:id/buckets

### Response

<%= headers 200 %>
<%= json(:bucket) { |hash| [hash] } %>

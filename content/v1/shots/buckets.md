---
title: Shots - Buckets
---

# Buckets

* TOC
{:toc}

## List buckets for a shot

    GET /shots/:id/buckets

### Response

<%= headers 200 %>
<%= json(:bucket_with_user) { |hash| [hash] } %>

---
title: Buckets - Shots | Dribbble API
---

# Shots

* TOC
{:toc}

## List shots in a bucket

    GET /buckets/:id/shots

### Response

<%= headers 200 %>
<%= json(:shot) { |hash| [hash] } %>

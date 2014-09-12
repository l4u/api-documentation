---
title: Projects - Shots
---

# Shots

* TOC
{:toc}

## List shots for a project

    GET /project/:id/shots

### Response

<%= headers 200 %>
<%= json(:shot) { |hash| [hash] } %>

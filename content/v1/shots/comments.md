---
title: Shots - Comments | Dribbble API
---

# Comments

* TOC
{:toc}

## List comments for a shot

    GET /shots/:id/comments

### Response

<%= headers 200 %>
<%= json(:comment) { |hash| [hash] } %>

---
title: Shots - Rebounds | Dribbble API
---

# Rebounds

* TOC
{:toc}

## List rebounds for a shot

    GET /shots/:id/rebounds

### Response

<%= headers 200 %>
<%= json(:shot) { |hash| [hash] } %>

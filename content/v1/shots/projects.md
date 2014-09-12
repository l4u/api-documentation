---
title: Shots - Projects
---

# Projects

* TOC
{:toc}

## List projects for a shot

    GET /shots/:id/projects

### Response

<%= headers 200 %>
<%= json(:project_with_user) { |hash| [hash] } %>

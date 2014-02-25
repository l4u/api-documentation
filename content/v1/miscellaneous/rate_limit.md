---
title: Miscellaneous - Rate Limit | Dribbble API
---

# Rate Limit

The overview documentation describes the [rate limit rules](/v1/#rate-limiting). You can check your current rate limit status at any time using the endpoint described below.

## Get your current rate limit status

Accessing this endpoint does not count against your rate limit.

    GET /rate_limit

### Response

<%= headers 200,
      "X-RateLimit-Limit"     => 5000,
      "X-RateLimit-Remaining" => 4999,
      "X-RateLimit-Reset"     => 1392321600
%>
<%= json resources: {
    core: {
      limit:     5000,
      remaining: 4999,
      reset:     1392321600
    }
  }
%>

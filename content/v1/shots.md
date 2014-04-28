---
title: Shots | Dribbble API
---

# Shots

* TOC
{:toc}

## List shots

    GET /shots

### Parameters

| Name | Type | Description |
|------|------|-------------|
| `list` | `string` | Limit the results to a specific type. One of `animated`, `attachments`, `debuts`, `playoffs`, `rebounds`, or `teams`. Default: Results of any type. |
| `timeframe` | `string` | One of `week`, `month`, or `year`. Default: Results from any time period. |
| `date` | `date` | Limit the timeframe to a specific date, week, month, or year. Must be in the format of `YYYY-MM-DD`. |
| `sort` | `string` | The sort field. One of `recent`, `views`, or `comments`. Default: Results are sorted by popularity. |

### Response

<%= headers 200 %>
<%= json(:shot) { |hash| [hash] } %>

## Get a shot

    GET /shots/:id

### Response

<%= headers 200 %>
<%= json :shot %>

---
title: Shots | Dribbble API
---

# Shots

* TOC
{:toc}

## List shots

    GET /shots

### Parameters

<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Type</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>list</code></td>
      <td><code>string</code></td>
      <td>
        Limit the results to a specific type with the following possible values:

        <ul>
          <li><code>animated</code></li>
          <li><code>debuts</code></li>
          <li><code>playoffs</code></li>
          <li><code>rebounds</code></li>
          <li><code>teams</code></li>
        </ul>

        Default: Results of any type.
      </td>
    </tr>
    <tr>
      <td><code>timeframe</code></td>
      <td><code>string</code></td>
      <td>One of <code>week</code>, <code>month</code>, or <code>year</code>. Default: Results from any time period.</td>
    </tr>
    <tr>
      <td><code>date</code></td>
      <td><code>date</code></td>
      <td>Limit the timeframe to a specific date, week, month, or year. Must be in the format of <code>YYYY-MM-DD</code>.</td>
    </tr>
    <tr>
      <td><code>sort</code></td>
      <td><code>string</code></td>
      <td>The sort field. One of <code>recent</code>, <code>views</code>, or <code>comments</code>. Default: Results are sorted by popularity.</td>
    </tr>
  </tbody>
</table>

### Response

<%= headers 200 %>
<%= json(:shot) { |hash| [hash] } %>

## Get a shot

    GET /shots/:id

### Response

<%= headers 200 %>
<%= json :shot %>

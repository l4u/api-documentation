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

        <strong>Default:</strong> Results of any type.
      </td>
    </tr>
    <tr>
      <td><code>timeframe</code></td>
      <td><code>string</code></td>
      <td>
        A period of time to limit the results to with the following possible values:

        <ul>
          <li><code>week</code></li>
          <li><code>month</code></li>
          <li><code>year</code></li>
        </ul>

        <strong>Default:</strong> Results from any time period.
      </td>
    </tr>
    <tr>
      <td><code>date</code></td>
      <td><code>date</code></td>
      <td>
        Limit the timeframe to a specific date, week, month, or year. Must be in the format of <code>YYYY-MM-DD</code>.
      </td>
    </tr>
    <tr>
      <td><code>sort</code></td>
      <td><code>string</code></td>
      <td>
        The sort field with the following possible values:

        <ul>
          <li><code>comments</code></li>
          <li><code>recent</code></li>
          <li><code>views</code></li>
        </ul>

        <strong>Default:</strong> Results are sorted by popularity.
      </td>
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

## Create a shot

    POST /shots

COMING SOON

## Update a shot

    PUT /shots/:id

COMING SOON

## Delete a shot

    DELETE /shots/:id

Deleting a shot requires the user to be authenticated with the `upload` scope.
The authenticated user must also own the shot.

---
kind: change
title: Following and Like Payloads
author: tristandunn
created_at: 2014-07-28 12:00:00
---

The followers and following endpoints no longer simply return a user. It now
returns `id` and `created_at` attributes with the user nested in it. Depending
on the endpoint the user will be under the `followee` or `follower` attribute.
See the [followers documentation](/v1/users/followers/) for updated examples.

The like endpoints were also previously changed to include `id` and `created_at`
attributes, with the [liking user](/v1/shots/likes/#list-the-likes-for-a-shot)
or [liked shot](/v1/users/likes/#list-shot-likes-for-a-user) nested.

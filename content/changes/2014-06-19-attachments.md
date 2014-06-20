---
kind: change
title: Introducing the Attachments API
author: tristandunn
created_at: 2014-06-19 12:00:00
---

We've added new endpoints for attachments. Listing attachments or retrieving a
single attachment are available for any scope. Creating or deleting attachments
requires the `upload` [scope](/v1/oauth/#scopes).

[Creating an attachment](/v1/shots/attachments/#create-an-attachment) is also
our first asynchronous endpoint, due to the processing required. Creating shots
will behave similarly when added.

[Read the full documentation](/v1/shots/attachments) to get started.

---
kind: change
title: Attachment Content Type
author: tristandunn
created_at: 2014-09-26 12:30:00
---

[Attachments](/v1/shots/attachments/) now include a `content_type` attribute, so
there's no need to parse the extension of the `url` or perform a HEAD request to
determine it. If you're showing attachment previews it should be much easier to
do so now.

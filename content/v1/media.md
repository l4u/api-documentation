---
title: Media Types
---

# Media Types

* TOC
{:toc}

Custom media types are used in the API to let consumers choose the format of the
data they wish to receive. This is done by adding one of the following types to
the `Accept` header when you make a request. Media types are specific to
resources, allowing them to change independently and support formats that other
resources don't.

A version is currently required and only supports `v1`, but may change in the
future. All Dribbble media types look like this:

    application/vnd.dribbble.v1.param+json

## Comment Body Property

The body of a comment can be written with some HTML, such as links, and may
include auto-linked URLs and username mentions.

### HTML

Returns HTML rendered from the body, which includes auto-linking URLs and
username mentions. Response will include a `body` attribute. This is the default
if you do not pass any specific media type.

    application/vnd.dribbble.v1.html+json

### Text

Returns a mostly text representation of the body, which is what we display in a
textarea when a user is editing a comment. It may contain some HTML if the user
provided any, but no auto-linking or mention links will be included. Response
will include a `body_text` attribute.

    application/vnd.dribbble.v1.text+json

## Shot Description Property

The description of a shot can be written with some HTML, such as links, and may
include auto-linked URLs and username mentions. The property is identical to a
comment body property, apart from the property name.

### HTML

Returns HTML rendered from the body, which includes auto-linking URLs and
username mentions. Response will include a `description` attribute. This is the
default if you do not pass any specific media type.

    application/vnd.dribbble.v1.html+json

### Text

Returns a mostly text representation of the description, which is what we
display in a textarea when a user is editing a description. It may contain some
HTML if the user provided any, but no auto-linking or mention links will be
included. Response will include a `description_text` attribute.

    application/vnd.dribbble.v1.text+json

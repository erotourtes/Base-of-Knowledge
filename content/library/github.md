---
title: "Github"
date: 2024-01-17T14:47:41Z
draft: true
---


# Github program
1. [actions](https://learn.microsoft.com/en-us/collections/n5p4a5z7keznp5)
2. [security](https://learn.microsoft.com/en-us/collections/rqymc6yw8q5rey)

## Intro
- [all metadata](https://docs.github.com/en/actions/creating-actions/metadata-syntax-for-github-actions)
- [triggers](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows)

```yml
name: "Hello Actions"
description: "Greet someone"
author: "octocat@github.com"

inputs:
    MY_NAME:
      description: "Who to greet"
      required: true
      default: "World"

runs:
    uses: "docker"
    image: "./path/Dockerfile"

branding:
    icon: "mic"
    color: "purple"
```

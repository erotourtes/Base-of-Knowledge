---
title: "RegEx"
date: 2022-09-16T12:10:17+03:00
draft: false
tags: ["regEx"]
summary: Regular expressions
---

[Website](https://regex101.com/)

## Examples
- `/ hello /` **hello**
- `/ [hH]ello /` **hello** wello **Hello**
> [] is a `Character Set`
- `/ [^hH]ello /` hello **wello** Hello
- `/ [a-z]ello /` **hello** **wello** **Hello**
> [A-z] is a 'Range'
[A-z] == [a-zA-Z]

- <cite>`/ [0-9]+/`[^1]</cite> **1**Hello **123** **12**
[^1]: [Go to Special Characters chapter](#special-characters)

- `/ [0-9]{2, 3} /` 1Hello **123** **12**
> {} means how many times needed to match
{2, } goes from 2 matches to infinity

## Metacharacters
- \d match any digit character
- \w matches any word character (included numbers, `_`, `,`)
- \s match whitespace (space, tab)
- \t match tab

## Special Characters
- \+ The one or more quantifier
- \\ The escape character
- [] The character set
- [^] The negate symbol in a character set
- ? Zero-or-one quantifier
- \. Any character except the newline
- \* Zero-or-more
- ^ Start
- & End
- | Or
- () Separate entity

## Flags
- `/g` don't stop after first match
- `/i` case insenstive match

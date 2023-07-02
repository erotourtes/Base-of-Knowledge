---
title: "Awk"
date: 2023-07-02T13:51:10Z
draft: false
---

#### Print Specific Columns (separator=`:`):
`awk -F':' '{print $1, $3}' file.txt`
``

#### Filter Lines Based on a Condition:
`awk '$3 > 50 {print $1}' file.txt`
#### Condition 
`awk '{if ($1 > 10) print "Greater"; else print "Lesser"}' file.txt`
#### Pattern
Awk operates based on patterns and associated actions. 
If a pattern matches a record, the associated action is executed. 
If no pattern is specified, the action is applied to all records. 
For example, to print lines containing the word "hello":  
`awk '/hello/ { print }' file.txt`
#### Built-in Variables:
Awk provides several built-in variables that you can use in your awk commands. Some commonly used variables include:

    NR: The current record number.
    NF: The number of fields in the current record.
    FNR: The record number within the current file.
    FILENAME: The name of the current file being processed.

Here's an example that prints the record number and the number of fields for each record:  
`awk '{ print "Record:", NR, "Fields:", NF }' file.txt`

> A "record" refers to a unit of input data that is processed by awk. 
By default, awk treats `each line of input as a separate record`.
However, you can customize the record separator using the RS variable.

> A "field" refers to a `subset of data within a record`. 
By default, awk considers each whitespace-separated word on a line as a field. You can access fields using the $1, $2, $3, and so on, where $1 represents the first field, $2 represents the second field, and so forth. The entire record (line) is represented by $0.

#### Awk Operators:
Awk supports various operators for performing operations on fields, variables, and expressions. Some common operators include:

    Arithmetic operators: +, -, *, /, %.
    Comparison operators: ==, !=, <, >, <=, >=.
    Assignment operators: =, +=, -=, *=, /=, %=.

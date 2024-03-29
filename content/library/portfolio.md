---
title: "Portfolio"
date: 2023-12-30T09:12:30Z
draft: false
showToc: true
TocOpen: true
tags: ["portfolio"]
---

A list of all my projects.

## Project Legend
**README Files:**  
Most projects listed below have an associated *README* file, 
providing detailed information about the purpose and features of the project.
For a comprehensive understanding of a project, please make sure to explore its *README*.


**Notation:**
- [D] - Deployed and can be viewed online
- [-] - No README file


---
## Kotlin
<!-- ### Harpooner -->
{{< hi "Harpooner" "https://raw.githubusercontent.com/erotourtes/Harpooner/89f5632f7a944d040aa32c79d0f13f382469c7fe/src/main/resources/META-INF/pluginIcon.svg" >}}

[**Repository**](https://github.com/erotourtes/Harpooner)  
A navigation plugin for IntelliJ IDEA, which allows you to quickly navigate to any file in the project.
[IntelliJ Marketplace](https://plugins.jetbrains.com/plugin/21796-harpooner)

**Technologies Used:**
- Jetbrains API
- Gradle
- JUnit5

**Challenges Faced:**
- Working with the absolutely new programming language and Jetbrains API.
- Writing unit tests for the Jetbrains API. Even though the API provides a convenient way for model-level testing,
  it is very hard to test my main logic, which is based on file system operations.

### EtherealPlot
[**Repository**](https://github.com/erotourtes/EtherealPlot)  
An Android/Jetpack compose application that allows you to plot simple math functions.

**Technologies Used:**
- Jetpack Compose
- Jetpack Compose Navigation
- Jetpack Compose ViewModel
- Room
- Kotlin Coroutines
- Kotlin Flow

**Challenges Faced:**
- Understanding the math behind plotting functions


### OOP-labs 
[**Repository**](https://github.com/erotourtes/OOP-labs)  
A collection of labs for the OOP course at the University.
Primarily focused on Desktop applications, using TornadoFX and JavaFX. 
Communication between separate projects is done via streams.

**Technologies Used:**
- TornadoFX
- JavaFX
- Kotlin Serialization
- Streams

**Challenges Faced:**
- Syncing 3 different projects via streams without any data loss


### Graphics
[**Repository**](https://github.com/erotourtes/Graphics)  
My attempt to understand how graphics both 2D and 3D works.


---
## Go
### OOP-labs 
[**Repository**](https://github.com/erotourtes/OOP-labs)  
A report generator in Latex for the OOP course.
[Example.pdf](https://github.com/erotourtes/OOP-labs/blob/main/lab6/report/main.pdf)


---
## TypeScript
### Telegraph
[**Repository**](https://github.com/erotourtes/Telegraph)  
A real-time chat application, written in TypeScript using the React framework.

**Technologies Used:**
- Dockerized
- Pure MySQL
- JWT authentication
- REST API
- WebSockets
- React with the Vite build tool

**Challenges Faced:**
- Managing the state of connected users
- Creating a right sql schema for the chat


### Tasks [D]
[**Repository**](https://github.com/erotourtes/Tasks)
[Demo](https://erotourtes.github.io/Tasks/)  
A task manager, which allows you to create recursive tasks and subtasks.

**Technologies Used:**
- React with the Vite build tool
- Redux
- TypeScript
- TailwindCSS

**Challenges Faced:**
- Separating the ui from the logic it is rendered with


### Async-Queue
[**Repository**](https://github.com/erotourtes/Aync-Queue)
Concurrent queue implementation.

**Challenge Faced:**
- Writing a queue, whose tasks can be aborted at any time


### Word-Wise [D]
[**Repository**](https://github.com/erotourtes/Word-Wise)
[Demo](https://erotourtes.github.io/Word-Wise/)  
A word game, written in TypeScript using the React framework. Needs to be deployed to a server to work properly.

**Technologies Used:**
- React with the Vite build tool
- TailwindCSS

<!-- ### Wayce -->
{{< hi "Wayce" "https://raw.githubusercontent.com/erotourtes/wayce/e4f8d067abd4b471e340c0aba76f76fbbaa0c63d/.github/Public/Icon.svg" >}}
[Repository](https://github.com/erotourtes/Wayce)  
A tf-idf based search engine, which allows you to search in different types of documents (pdf, txt, etc.) and Wikipedia.


### Database-coursework [-]
[**Repository**](https://github.com/erotourtes/Database-coursework)  
A database for a fictional company, which operates with open data.
Implementation of the team Database Requirements Gathering [Page](https://dmutre.github.io/edu_db_labs-IM-21/use%20cases/#_1-%D0%B7%D0%B0%D0%B3%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0-%D1%81%D1%85%D0%B5%D0%BC%D0%B0)

**Technologies Used:**
- NestJS
- MySQL


### MCP
[**Repository**](https://github.com/erotourtes/MCP)  
A basic protocol over TCP. Can be integrated with [wireshark](https://www.wireshark.org).


### NMT [D]
[**Repository**](https://github.com/erotourtes/NMT)
[Demo](https://erotourtes.github.io/NMT/public)  
The program I wrote to learn accents in the Ukranian language.


---
## JavaScript
### SnakeJS [D]
[**Repository**](https://github.com/erotourtes/SnakeJS)
[Demo](https://erotourtes.github.io/SnakeJS/)
> Move with WASD or arrow keys, restart by clicking on the screen

**Technologies Used:**
- pixi.js


---
## Html/CSS only    
<!-- ### lyceum-last-project [D] -->
{{< hi "lyceum-last-project [D]" "https://raw.githubusercontent.com/erotourtes/lyceum-last-project/d5e65c4ae9cb0b72a1b8f3fb51bfb5deb32ffa6e/src/proj.svg" >}}
[**Repository**](https://github.com/erotourtes/lyceum-last-project)
[Demo](https://erotourtes.github.io/lyceum-last-project/)


---
## C
### ASD-labs
[**Repository**](https://github.com/erotourtes/ASD-labs)  
A collection of labs for the Algorithms and Data Structures course at the University. 
The repository contains a lot of different algorithms, such as graph traversal with visual examples.

**Challenges Faced:**
- Finding and fixing memory leaks
- Using `void*` pointesr to create a generic data structure

---
## Lua
### Wrapper-machine.nvim
[**Repository**](https://github.com/erotourtes/Wrapper-machine.nvim)  
A small plugin for the Neovim editor, which allows you to change brackets and quotes more easily.

**Technologies Used:**
- Neovim Lua API


---
## Python
### Anki-translator
[**Repository**](https://github.com/erotourtes/Anki-translator)  
A program that allows you to translate the whole deck of cards in Anki in one click .


---
## C++
### myConsoleSnake [-]   
[**Repository**](https://github.com/erotourtes/myConsoleSnake)  
My first saved project!!

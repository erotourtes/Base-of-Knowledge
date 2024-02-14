---
title: "Architectural patterns"
date: 2023-12-14T16:10:31+03:00
draft: false
---

1. UI layer - captures user input and displays the results of the domain data processing.
1. App layer - controls the workflow of the application and handles user input.
1. Domain layer - aka. business logic layer, contains the core logic of the application.
1. Infrastructure layer - contains the implementation of the application's technical capabilities. (network, storage, etc.)


Presentation layer - ui + app

## MVx (Model-View-Controller, Model-View-Presenter, Model-View-ViewModel)
Model stands for the domain model, which is the data and/or data structures  and/or business logic of the application. It is independent of the user interface.

View is the user interface, which displays the data and forwards user input to the controller.

X is the controller, presenter or view model, which is responsible for the interaction between the model and the view.

## Truth
MVC, MVP, MVVM are all the same thing. They are all a variation of the same pattern. The only difference is the direction of the data flow.
So it is dependent on the perspective of the developer.

## Benefits
1. Separation of concerns (ui from business logic; Activities and Fragments are god objects, so they are not a place for ui logic)


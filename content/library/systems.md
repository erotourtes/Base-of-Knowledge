---
title: "Systems"
date: 2023-09-04T01:10:59Z
draft: true
---

system -> abstraction black box
model of the world with input and output


time 
state
functionality


component - element_1 + ... + element_n
element - can't be divided


interaction between components


experience is the only way to make a system


неповністю-визначена
x0---->y0
x1---->y1
x2
x3---->y2


uml : class diagram


analyse similarities between classes -> classification
classification --> generalisation

квантований стан - окремо виділений 
автоматний час - не continous


подія - момента часу, коли система змінює миттєво свій стан
повідомлення - інформація про зміну стану (time value + state value)


activity - momentum of time when system is in the same state
more activity -> change state 


orientation on activity
orientation on action (подія)


діаграма послідовностей предачі повідомлень



usero      A
  | do work
  | -----> ||
           || <- фокус

номінальні шкала
ординальна шкала
ітеральна шкала

- перехідник (багато на багато) - багато на 1 (асоціативний звязок)
- прості обєкти (flat) - агрегація - транзитивністю (a -> b -> c => a -> c)
- відношення узагальнення - відношення асоціативні або агрегацією


- вимоги до системи 
- use cases з вимог 
- модель педметної області з entity use cases (модель симантична) 
- модель сутність-звязки (модель організації інформації, даталогічна)

домен значень (строки, числа, картинки) (e.x text)
атрибути (елементарний обєкт з імям і привязаний до домену) (e.x name)
сутність (e.x user (has name))
відношення


//
//  main.swift
//  triangle
//
//  Created by Илья on 14/07/2019.
//  Copyright © 2019 Илья Сазоненков. All rights reserved.
//

import Foundation

print("Hello, World!")

//Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

var legA:Double = 245
var legB:Double = 13

var s = legA*legB

var y:Double = sqrt((legA*legA)+(legB*legB))
var c = Double(round(100*y)/100)

var z:Double = legA+legB+c
var p = Double(round(100*z)/100)


print("Площадь треугльник равна "+String(s))
print("Гипотенуза треугольки равна "+String(c))
print("Периметр треугольника равен "+String(p))


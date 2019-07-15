//
//  main.swift
//  bank
//
//  Created by Илья on 14/07/2019.
//  Copyright © 2019 Илья Сазоненков. All rights reserved.
//

import Foundation

print("Hello, World!")

//*Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через                             5 лет.


var userCash:Double = 5000
var userPercent:Double = 5

userPercent = userPercent/100


var year1 = userCash + (userCash*userPercent)
var year2 = year1+(year1*userPercent)
var year3 = year2+(year2*userPercent)
var year4 = year3+(year3*userPercent)
var year5 = year4+(year4*userPercent)

print("через год сумма вклада будет равна "  + String(year1)  + " \nчерез 2 года " + String(year2) + " \nчерез 3 года " + String(year3) + " \nчерез 4 года " + String(year4) + " \nчерез 5 лет " + String(year5))




//
//  main.swift
//  lessonOdin
//
//  Created by Илья on 14/07/2019.
//  Copyright © 2019 Илья Сазоненков. All rights reserved.
//

import Foundation

print("Hello, World!")

//Решить квадратное уравнение ax^2+bx+c

var a:Int = 2
var b:Int = 6
var c:Int = 3

var d:Int = (b*b)-4*(a*c)

print ("дискриминант " + String(d))

if d<0{
    print("корней нет")
}
else if d==0{
    print("есть ровно один корень")
}
else if d>0{
    print("корней будет два")
    }
    



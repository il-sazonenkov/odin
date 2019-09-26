//
//  User.swift
//  VK
//
//  Created by Илья on 14/08/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import UIKit

struct Friend {
    var nameFriend: String
    var avatarFriend: UIImage?
}

let svetlakov = Friend(nameFriend: "Светлаков Сергей", avatarFriend: UIImage(named: "fr1"))
let sobchak = Friend(nameFriend: "Собчак Ксения", avatarFriend: UIImage(named: "fr3"))
let karginov = Friend(nameFriend: "Каргинов Тимур", avatarFriend: UIImage(named: "fr10"))
let basta = Friend(nameFriend: "Вакуленко Василий", avatarFriend: UIImage(named: "fr4"))
let hrustalev = Friend(nameFriend: "Хрусталёв Владимир", avatarFriend: UIImage(named: "fr5"))
let slepakov = Friend(nameFriend: "Слепаков Семен", avatarFriend: UIImage(named: "fr6"))
let komarov = Friend(nameFriend: "Комаров Виктор", avatarFriend: UIImage(named: "fr7"))
let harlamov = Friend(nameFriend: "Харламов Гарик", avatarFriend: UIImage(named: "fr8"))
let naval = Friend(nameFriend: "Навальный Алексей", avatarFriend: UIImage(named: "fr9"))


var friends = [
    svetlakov,
    sobchak,
    karginov,
    basta,
    hrustalev,
    slepakov,
    komarov,
    harlamov,
    naval
]



var t: Friend?


var surname = [String]()

//Достаем имена из массива структур
func forSurname() {
for a in friends {
    surname.append(a.nameFriend)
    }
}
var fSurname = [Character]()

//Достаем первые буквы из массива имен
func forFirstSimbol() {
for firstSur in surname {
    fSurname.append(firstSur.first!)
    }
}

    let noRepeat = Array(Set(fSurname)) //Удаление дубликатов
    let surnameSortedNoRepeat = noRepeat.sorted() //Сортировка массива по алфавиту






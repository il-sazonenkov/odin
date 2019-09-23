//
//  Group.swift
//  VK
//
//  Created by Илья on 14/08/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import UIKit

struct Group {
    var nameGroup: String
    var avatarGroup: UIImage?
}

let music = Group(nameGroup: "Музыка", avatarGroup: UIImage(named: "music"))
let film = Group(nameGroup: "Кино", avatarGroup: UIImage(named: "film"))
let games = Group(nameGroup: "Игры", avatarGroup: UIImage(named: "games"))
let science = Group(nameGroup: "Наука", avatarGroup: UIImage(named: "science"))
let sport = Group(nameGroup: "Спорт", avatarGroup: UIImage(named: "sport"))
let food = Group(nameGroup: "Еда", avatarGroup: UIImage(named: "food"))
let travel = Group(nameGroup: "Путешествия", avatarGroup: UIImage(named: "travel"))
let technology = Group(nameGroup: "Технологии", avatarGroup: UIImage(named: "technology"))

var groups = [
    music,
    film,
    games,
    science,
    sport,
    food,
    travel,
    technology
]

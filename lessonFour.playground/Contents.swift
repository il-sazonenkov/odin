import UIKit
/*1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.*/

enum EngineStarting: String  {
    case on = "запущен"
    case off = "выключен"
}

enum Window: String {
    case open = "открыты"
    case close = "закрыты"
}

enum Cargo: String {
    case full = "полный"
    case empty = "пустой"
}

class Auto {
    var mark: String
    var year: Int
    var trunk: Int
    var engineStarting: EngineStarting
    var window: Window
    var cargo: Cargo
    
   func unload() {
        switch cargo {
        case .full:
            print("багажник полный")
        case .empty:
            print("багажник пустой")
        }
    }

    init (mark: String, year: Int, trunk: Int, engineStarting: EngineStarting, window: Window, cargo: Cargo) {
        self.mark = mark
        self.year = year
        self.trunk = trunk
        self.engineStarting = engineStarting
        self.window = window
        self.cargo = cargo
    }
}
enum Way: String {
    case yes = "в пути"
    case no = "на базе"
}

class TrunkCar: Auto {
    var wheels: Int
    var way: Way
    init (mark: String, year: Int, trunk: Int, engineStarting: EngineStarting, window: Window, cargo: Cargo, wheels: Int, way: Way) {
        self.wheels = wheels
        self.way = way
        super.init (mark: mark, year: year, trunk: trunk, engineStarting: engineStarting, window: window, cargo: cargo)
    }
    func road() {
        switch way {
        case .yes:
            print("камаз в пути")
        case .no:
            print("камаз пустой, на базе")
        }
    }
}

enum Spoiler: String {
    case open = "открыт"
    case close = "закрыт"
}

class SportСar: Auto {
    var spoiler : Spoiler
    init (mark: String, year: Int, trunk: Int, engineStarting: EngineStarting, window: Window, cargo: Cargo, spoiler: Spoiler) {
        self.spoiler = spoiler
        
        super.init (mark: mark, year: year, trunk: trunk, engineStarting: engineStarting, window: window, cargo: cargo)
    }
     func sport() {
        switch spoiler {
        case .open:
            print("спойлер снаружи")
        case .close:
            print("спойлер внутри")
        }
    }
}

var honda = Auto(mark: "HONDA CR-V", year: 2000, trunk: 1500, engineStarting: .off, window: .close, cargo: .empty)
print("Автомобиль марки \"\(honda.mark)\", года выпуска: \(honda.year) г., c багажником в объёме: \(honda.trunk) литров, двигатель: \(honda.engineStarting.rawValue), окна: \(honda.window.rawValue), багажник: \(honda.cargo.rawValue)")
honda.unload()

var formula1 = SportСar(mark: "FORMULA-1", year: 2019, trunk: 5, engineStarting: .on, window: .close, cargo: .empty, spoiler: .close)
print("Автомобиль марки \"\(formula1.mark)\", года выпуска: \(formula1.year) г., c багажником в объёме: \(formula1.trunk) литров, двигатель: \(formula1.engineStarting.rawValue), окна: \(formula1.window.rawValue), багажник: \(formula1.cargo.rawValue), состояние спойлера: \(formula1.spoiler.rawValue)")
formula1.sport()

var kamaz = TrunkCar(mark: "KAMAZ", year: 2007, trunk: 30000, engineStarting: .on, window: .open, cargo: .full, wheels: 8, way: .no)
print("Автомобиль марки \"\(kamaz.mark)\", года выпуска: \(kamaz.year) г., c багажником в объёме: \(kamaz.trunk) литров, двигатель: \(kamaz.engineStarting.rawValue), окна: \(kamaz.window.rawValue), багажник: \(kamaz.cargo.rawValue), кол-во колёс: \(kamaz.wheels), сейчас: \(kamaz.way.rawValue)")
kamaz.road()

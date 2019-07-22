import UIKit
/* 1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль. */


// 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
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

// 1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
struct aCar {
// 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
    var mark: String
    var year: Int
    var trunk: Int
    var engineStarting: EngineStarting
    var window: Window
    var cargo: Cargo
    
// 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    mutating func changeWindow() {
        self.window = window == .open ? .close : .open
    }
    mutating func changeCargo() {
        self.cargo = cargo == .full ? .empty : .full
    }
}
// 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
var mercedes  = aCar(mark: "Mercedes", year: 2019, trunk: 300, engineStarting: .on, window: .close, cargo: .full)
var bmw = aCar(mark: "BMW", year: 2018, trunk: 550, engineStarting: .off, window: .open, cargo: .empty)

// 6. Вывести значения свойств экземпляров в консоль.
print("Легковой втомобиль марки: \"\(mercedes.mark)\"\n Год выпуска: \(mercedes.year)\n Объём багажника: \(mercedes.trunk)\n Двигатель: \(mercedes.engineStarting.rawValue)\n Состояние окон: \(mercedes.window.rawValue)\n Багажник: \(mercedes.cargo.rawValue) ")
print("Легковой автомобиль марки: \"\(bmw.mark)\"\n Год выпуска: \(bmw.year)\n Объём багажника: \(bmw.trunk)\n Двигатель: \(bmw.engineStarting.rawValue)\n Состояние окон: \(bmw.window.rawValue)\n Багажник: \(bmw.cargo.rawValue) ")

enum EngineStartingA: String  {
    case on = "запущен"
    case off = "выключен"
}

// Далее структура грузового автомобиля

enum WindowA: String {
    case open = "открыты"
    case close = "закрыты"
}

enum CargoA: String {
    case full = "полный"
    case empty = "пустой"
}

struct bCar {

    var mark: String
    var year: Int
    var trunk: Int
    var engineStarting: EngineStartingA
    var window: WindowA
    var cargo: CargoA
    

    mutating func changeWindowA() {
        self.window = window == .open ? .close : .open
    }
    mutating func changeCargoA() {
        self.cargo = cargo == .full ? .empty : .full
    }
}

var kamaz  = bCar(mark: "KAMAZ", year: 2017, trunk: 3000, engineStarting: .on, window: .close, cargo: .full)


print("Грузовой втомобиль марки: \"\(kamaz.mark)\"\n Год выпуска: \(kamaz.year)\n Объём багажника: \(kamaz.trunk)\n Двигатель: \(kamaz.engineStarting.rawValue)\n Состояние окон: \(kamaz.window.rawValue)\n Багажник: \(kamaz.cargo.rawValue) ")

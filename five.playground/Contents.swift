import UIKit
/*lessonFive
1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести сами объекты в консоль.*/

enum EngineStarting: String  {
    case on = "запущен"
    case off = "заглушен"
}

enum Window: String {
    case open = "открыты"
    case close = "закрыты"
}

protocol Car {
    var mark: String {get}
    var year: Int {get}
    var theTrunk: Double {get}
    var mileage: Double {get set}
    var color: String {get set}
    var window: Window  {get set}
    var engineStarting: EngineStarting {get set}
    func some ()
}

extension Car {
    func windows() {
        switch window {
        case .open:
            print("окна открыты")
        case .close:
            print("окна закрыты")
        }
    }
}
extension Car {
        func start() {
            switch engineStarting {
            case .on:
                print("двигатель запущен")
            case .off:
                print("двигатель заглушен")
            }
        }
    }
enum Way: String {
    case yes = "в пути"
    case no = "на базе"
}
class TrunkCar: Car {
    func some() {
        switch way {
        case .yes:
            print("камаз в пути")
        case .no:
            print("камаз пустой, на базе")
        }
    }
    var mark: String
    var year: Int
    var theTrunk: Double
    var mileage: Double
    var color: String
    var window: Window
    var engineStarting: EngineStarting
    var way: Way
    var wheels: Int
    
    init(mark: String, year: Int, theTrunk: Double, mileage: Double, color: String, window: Window, engineStarting: EngineStarting, way: Way, wheels: Int) {
        self.mark = mark
        self.year = year
        self.theTrunk = theTrunk
        self.mileage = mileage
        self.color = color
        self.window = window
        self.engineStarting = engineStarting
        self.way = way
        self.wheels = wheels
    }
}
enum Spoiler: String {
    case open = "снаружи"
    case close = "внутри"
}

class SportCar: Car {
    func some () {
        switch spoiler {
        case .open:
            print("спойлер снаружи")
        case .close:
            print("спойлер внутри")
        }
    }
    var mark: String
    var year: Int
    var theTrunk: Double
    var mileage: Double
    var color: String
    var window: Window
    var engineStarting: EngineStarting
    var spoiler: Spoiler
   
    init(mark: String, year: Int, theTrunk: Double, mileage: Double, color: String, window: Window, engineStarting: EngineStarting, spoiler: Spoiler) {
        self.mark = mark
        self.year = year
        self.theTrunk = theTrunk
        self.mileage = mileage
        self.color = color
        self.window = window
        self.engineStarting = engineStarting
        self.spoiler = spoiler
    }
}
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль марки: \(mark), год выпуска: \(year), объём цистерны: \(theTrunk) литра, киллометраж: \(mileage) км., цвет: \(color), состояние окон: \(window.rawValue), состояние двигателя: \(engineStarting.rawValue), состояние на дороге: \(way.rawValue), колличество колёс: \(wheels)"
    }
}
extension SportCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль марки: \(mark), год выпуска: \(year), объём багажника: \(theTrunk) литра, киллометраж: \(mileage) км., цвет: \(color), состояние окон: \(window.rawValue), состояние двигателя: \(engineStarting.rawValue), состояние спойлера: \(spoiler.rawValue)"
    }
}
var kamaz = TrunkCar(mark: "KAMAZ", year: 2008, theTrunk: 2204.0, mileage: 66.3, color: "чёрный", window: .close, engineStarting: .off, way: .no, wheels: 16)
print(kamaz)
kamaz.start()
var mercedes = SportCar(mark: "MERCEDES AMG", year: 2019, theTrunk: 203, mileage: 10000, color: "черный(матовый)", window: .open, engineStarting: .on, spoiler: .open)
print(mercedes)
mercedes.windows()

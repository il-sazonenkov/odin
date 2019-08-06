import UIKit

/*  1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
    2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.  */


// Создаём перечисление Error, и перечисляем в нём возможные ошибки
enum fillUpError: Error {
    case invalidGas
    case volumeExceeded(gasEx: Int)
}
// Саздаём класс автомобиля
class Mercedes {
    var models: String
    var gasoline: Int
    var gastank: Int
    init(models: String, gasoline: Int, gastank: Int) {
        self.models = models
        self.gasoline = gasoline
        self.gastank = gastank
      
    }
// Саздаём метод, который будет заправлять автомобиль
    func fillUp(gasoline g: Int, gastank t: Int) throws -> String {
// Если будет заправляться бензин, который не будет подходить для нашего автомобиля, то метод не будет завершен, и выдаст ошибку о том что "Бензин не подходит"
        if g != gasoline.self  {
            throw fillUpError.invalidGas
        }
// Если бензин подходит, то автомобиль заправляем.
        else {
            print("Автомобиль заправлен.")
        }
// Далее идёт метод, который следит за колличеством заправленного бензина. Если бензина залито больше, чем позволяет объём бензобака, то выдаст ошибку о том что "Бензина слишком много" и сообщит сколько нужно отлить, для того что бы продолжить путь.
        if t > gastank.self {
            throw fillUpError.volumeExceeded(gasEx: t - gastank.self)
        }
  
        return "OK"
    }
}
// Создаём автомобиль, в который можно залить бензин марки "92" и не больше 70 литров
var e200 = Mercedes(models: "E-200", gasoline: 92, gastank: 70)
// Начинаем заливать бензин "92" на 75 литров
do {
    try e200.fillUp(gasoline: 92, gastank: 75)
} catch fillUpError.invalidGas {
    print("Бензин не подходит.")
} catch fillUpError.volumeExceeded(let gasEx) {
    print("Слишком много бензина, отлейте \(gasEx) литров, и можете уезжать.")
}

// В консоль отоброзится сообщение: "Автомобиль заправлен. Слишком много бензина, отлейте 5 литров, и можете уезжать."

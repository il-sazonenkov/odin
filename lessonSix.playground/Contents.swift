import UIKit

/*
1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
*/

// Создаем протокол для использования метода высшего порядка
protocol Evaluable {
    var cost: Int { get }
    var color: String { get }
}


//Создаём структуру данных типа "Овощи"
struct Vegetables: Evaluable {
    var name: String
    var color: String
    var cost: Int
}
//Создаём структуру данных типа "Фрукты"
struct Fruits: Evaluable {
    var name: String
    var color: String
    var cost: Int
}
//Создаёем колекцию типа "Очередь", с использованием дженериков
struct FoodBascet<T: Evaluable>  {
    
    var bascet: [T] = []
        mutating func pop() -> T {
            return bascet.removeFirst()
        }
    
        mutating func push(food: T) {
            bascet.append(food)
        }
    func printDescription() {
        print(bascet)
        
    }

//Добавим метод высшего порядка. Подсчет стоимости продуктов в корзине
    func totalCoast() -> Int {
        var totalCoast = 0
        bascet.forEach { (food) in
            totalCoast += food.cost
        }
        return totalCoast
    }
}

//Создаём корзину для овощей
var vegetablesBascet = FoodBascet<Vegetables>()

//Создаём корзину для фруктов
var fruitsBascet = FoodBascet<Fruits>()

//Создаём фрукты
let apple = Fruits(name: "Яблоко", color: "Зеленый", cost: 77)
let pear = Fruits(name: "Груша", color: "Желтый", cost: 55)
let orange = Fruits(name: "Апельсин", color: "Желтый", cost: 70)
let banana = Fruits(name: "Банан", color: "Желтый", cost: 78)
let mango = Fruits(name: "Манго", color: "Желтый", cost: 233)

//Создаём овощи
let cucumber = Vegetables(name: "Огурец", color: "Зеленый", cost: 151)
let pepper = Vegetables(name: "Перец", color: "Красный", cost: 80)
let buckwheat = Vegetables(name: "Гречка", color: "Коричневый", cost: 66)
let peas = Vegetables(name: "Горох", color: "Зеленый", cost: 115)
let tomato = Vegetables(name: "Томат", color: "Красный", cost: 160)

//Добавляем фрукты в корзину для фруктов
//Первый фрукт - яблоко
fruitsBascet.push(food: apple)

fruitsBascet.push(food: pear)
fruitsBascet.push(food: orange)
fruitsBascet.push(food: banana)
fruitsBascet.push(food: mango)

//Добавляем овощи в корзину для овощей
vegetablesBascet.push(food: cucumber)
vegetablesBascet.push(food: pepper)
vegetablesBascet.push(food: buckwheat)
vegetablesBascet.push(food: peas)

//Смотри что в корзине с фруктами
fruitsBascet.printDescription()

//Забираем из корзины с фруктами первый фрукт, который в неё попал ( FIFO ) (Яблоко)
print(fruitsBascet.pop())

//Выполняем метод высшего порядка. Подсчитаем стоимость продуктов в корзине с фруктами.
print(fruitsBascet.totalCoast())



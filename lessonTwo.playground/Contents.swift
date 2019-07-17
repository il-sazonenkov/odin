import UIKit

// 1. Написать функцию, которая определяет, четное число или нет.

func number2 (a: Int) {
    a % 2 == 0 ? print("Число четноё") : print("Число нечетноё")
}
number2(a: 13)

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func number3 (b: Int) {
    b % 3 == 0 ? print("Число делится на 3 без остатка") : print("Число делится на 3 c остатком")
}
number3(b: 33)

// 3. Создать возрастающий массив из 100 чисел.

var array = [Int]()
for arrai in (0...100){
array.append(arrai)
}
print(array)


// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

/*
 for value in array {
    if value % 2 == 0 {
        array.remove(at: array.firstIndex(of: value)!)
    }
}
for value2 in array {
    if value2 % 3 == 0 {
        array.remove(at: array.firstIndex(of: value2)!)
    }
}
print(array)

 */
func all (aff: Int, bff: Int){
for value in array {
    if value % aff == 0 {
        array.remove(at: array.firstIndex(of: value)!)
    }
}
for value2 in array {
    if value2 % bff == 0 {
        array.remove(at: array.firstIndex(of: value2)!)
    }
}
print(array)
}

all (aff: 2, bff: 3)

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//  Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.


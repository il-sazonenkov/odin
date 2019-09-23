//
//  GradientView.swift
//  VK
//
//  Created by Илья on 02/09/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

//Создадим новый файл swift и класс GradientView:
import UIKit

@IBDesignable class GradientView: UIView {
    
    //Добавляем свойства, отвечающие за параметры градиента:
    //Вызов методов после изменения свойств
    @IBInspectable var startColor: UIColor = .white { //Начальный цвет градиента
        didSet {
            self.updateColors()
        }
    }
    @IBInspectable var endColor: UIColor = .black { //Конечный цвет градиента
        didSet {
            self.updateColors()
        }
    }
    @IBInspectable var startLocations: CGFloat = 0 { //Начало градиента
        didSet {
            self.updateLocations()
        }
    }
    @IBInspectable var endLocations: CGFloat = 1 { //Конец градиента
        didSet {
            self.updateLocations()
        }
    }
    @IBInspectable var startPoint: CGPoint = .zero { //Начальная точка градиента
        didSet {
            self.updateStartPoint()
        }
    }
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) { //Конечная точка градиента
        didSet {
            self.updateEndPoint()
        }
    }
    
    //Изменяем класс слоя на CAGradientLayer:
    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    //Cоздаём вычисляемую переменную для удобной работы со слоем:
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
   
    //Методы, которые будут обновлять параметры слоя с градиентом:
    func updateLocations() {
        self.gradientLayer.locations = [self.startLocations as NSNumber, self.endLocations as NSNumber]
    }
    func updateColors() {
        self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
    }
    func updateStartPoint() {
        self.gradientLayer.startPoint = startPoint
    }
    func updateEndPoint() {
        self.gradientLayer.endPoint = endPoint
    }
}



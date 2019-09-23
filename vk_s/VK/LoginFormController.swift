//
//  LoginFormController.swift
//  VK
//
//  Created by Илья on 04/08/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import UIKit
import WebKit

class LoginFormController: UIViewController {
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
//Метод нажатия на кнопку "Войти"
    @IBAction func loginButtonPressed (_ sender: Any) {
//Логика авторизации:
        //Получаем текст логина
        let login = self.loginInput.text ?? ""
        //Получаем текст пароля
        let password = self.passwordInput.text ?? ""
        //Проверяем верны ли они
        if login == "admin" && password == "1234" {
            print("успешная авторизация")
        }
        else {
            print("ошибка данных")
        }
    }
    
//Метод проверки логина и пароля 
override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    //Проверяем данные
    let checkResult = checkUserData()
    //Если данные не верны, покажем ошибку
    if !checkResult {
        showLoginError()
    }
    //Вернем результат
    return checkResult
    }
    
    func checkUserData() -> Bool {
        guard let login = loginInput.text,
            let password = passwordInput.text else { return false }
        
        
        if login == "admin" && password == "1234" {
            return true
        } else {
            return false
        }
    }
    
//Создаём AlertConroller. Cообщение об ошибке.
    func showLoginError() {
    //Создаём контроллер
    let alert = UIAlertController(title: "Ошибка", message: "Введены неправильные данные пользователя", preferredStyle: .alert)
    //Создаём кнопку для UIAlertController
    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    //Добавляем кнопку на UIAlertController
    alert.addAction(action)
    //Показываем UIAlertController
    present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    
//Исчезновение клавиатуры при клике по пустому месту на экране
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      

        
    // let session = Session.instanceSession
    //   session.token = "anyToken"
    //   session.userId = 123
        
        //Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        //Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
 //Подписываемся на два уведомления из центра уведомлений, которые рассылает клавиатура.
    override func viewWillAppear(_ animated: Bool) {
        
        //Первое приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notifification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        //Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHidden(notifification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //Метод отписки от уведомлений при исчезновении контроллера с экрана.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //Когда клавиатура появляется
    @objc func keyboardWasShown(notifification: Notification){
        //Получаем размер клавиатуры
        let info = notifification.userInfo! as NSDictionary
        let size = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: size.height, right: 0)
        //Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView.contentInset = insets
        self.scrollView.scrollIndicatorInsets = insets
    }
    //Когда клавиатура исчезает
    @objc func keyboardWillHidden(notifification: Notification){
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let insets = UIEdgeInsets.zero
        self.scrollView.contentInset = insets
        self.scrollView.scrollIndicatorInsets = insets
    }
}

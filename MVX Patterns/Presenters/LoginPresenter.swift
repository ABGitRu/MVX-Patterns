//
//  LoginPresenter.swift
//  MVX Patterns
//
//  Created by Mac on 17.07.2021.
//

import Foundation

protocol LoginPresenterProtocol {
    init(view: LoginViewProtocol, person: Person)
    func showGreeting()
}

class LoginPresenter: LoginPresenterProtocol {
    
    unowned let view: LoginViewProtocol
    let person: Person
    
    required init(view: LoginViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = "Hello \(person.name)"
        view.setGreeting(greeting)
    }
    
    
}

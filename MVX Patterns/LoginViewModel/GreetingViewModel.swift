//
//  GreetingViewModel.swift
//  MVX Patterns
//
//  Created by Mac on 17.07.2021.
//

import Foundation

protocol GreetingViewModelProtocol {
    var greeting: String? { get }
    var greetingDidChange: ((GreetingViewModelProtocol) -> Void)? { get set }
    func showGreeting()
    var person: Person { get set }
}

class GreetingViewModel: GreetingViewModelProtocol {
    var person: Person = Person(name: "")
    
    var greeting: String? {
        didSet {
            greetingDidChange?(self)
        }
    }
    
    var greetingDidChange: ((GreetingViewModelProtocol) -> Void)?
    
    func showGreeting() {
        greeting = "Hello \(person.name)"
    }
    
    
}

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
    init(person: Person)
    func showGreeting()
}

class GreetingViewModel: GreetingViewModelProtocol {
    
    var greeting: String? {
        didSet {
            greetingDidChange?(self)
        }
    }
    
    var greetingDidChange: ((GreetingViewModelProtocol) -> Void)?
    
    private let person: Person
    
    required init(person: Person) {
        self.person = person
    }
    
    func showGreeting() {
        greeting = "Hello \(person.name)"
    }
    
    
}

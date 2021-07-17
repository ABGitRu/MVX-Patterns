//
//  LoginViewController.swift
//  MVX Patterns
//
//  Created by Mac on 15.07.2021.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func setGreeting(_ greeting: String)
}

class LoginViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap me", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 1, green: 0.7553976295, blue: 0.4469351178, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    let greetingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private var presenter: LoginPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        let person = Person(name: "Alex")
        presenter = LoginPresenter(view: self, person: person)
        setUI()
    }
    
    override func viewWillLayoutSubviews() {
        setConstraints()
    }
    
    private func setUI() {
        view.addSubview(button)
        view.addSubview(greetingLabel)
    }
    
    @objc private func tapButton() {
        presenter.showGreeting()
    }
    
    private func setConstraints() {
        let constraints = [
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 60),
            
            greetingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)

        ]
        NSLayoutConstraint.activate(constraints)
    }


}

extension LoginViewController: LoginViewProtocol {
    func setGreeting(_ greeting: String) {
        greetingLabel.text = greeting
    }
}

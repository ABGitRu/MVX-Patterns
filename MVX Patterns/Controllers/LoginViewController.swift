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
    
    let textfield: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.borderStyle = .roundedRect
        tf.placeholder = "Enter your name"
        tf.backgroundColor = #colorLiteral(red: 0.1794060601, green: 0.1794060601, blue: 0.1794060601, alpha: 1)
        return tf
    }()
    private var presenter: LoginPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.delegate = self
        setUI()
    }
    
    override func viewWillLayoutSubviews() {
        setConstraints()
    }
    
    private func setUI() {
        view.addSubview(button)
        view.addSubview(greetingLabel)
        view.addSubview(textfield)
    }
    
    @objc private func tapButton() {
        showName()
    }
    
    private func setConstraints() {
        let constraints = [
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 60),
            
            greetingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            textfield.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10),
            textfield.widthAnchor.constraint(equalTo: button.widthAnchor),
            textfield.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func showName() {
        if let text = textfield.text {
            presenter = LoginPresenter(view: self, person: Person(name: text))
        }
        presenter?.showGreeting()
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        showName()
        return true
    }
}

extension LoginViewController: LoginViewProtocol {
    func setGreeting(_ greeting: String) {
        greetingLabel.text = greeting
    }
}


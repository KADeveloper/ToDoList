//
//  NewTaskView.swift
//  ToDoList
//
//  Created by Динара Аминова on 17.12.2020.
//

import UIKit

class NewTaskView: UIView {
    //MARK: - UI
    let setTitleText: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Enter task name here",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 250/255, green: 128/255, blue: 114/255, alpha: 1)])
        textField.textAlignment = .center
        textField.returnKeyType = UIReturnKeyType.continue
        textField.backgroundColor = .white
        textField.layer.masksToBounds = false
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1
        textField.textColor = UIColor(red: 250/255, green: 128/255, blue: 114/255, alpha: 1)
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.tag = 0
        return textField
    }()
    
    let setDescriptionText: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Enter task description here",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 250/255, green: 128/255, blue: 114/255, alpha: 1)])
        textField.textAlignment = .center
        textField.returnKeyType = UIReturnKeyType.send
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1
        textField.textColor = UIColor(red: 250/255, green: 128/255, blue: 114/255, alpha: 1)
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.tag = 1
        return textField
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.setTitleColor(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 250/255, green: 128/255, blue: 114/255, alpha: 0.8)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    
    //MARK: - Init
    init() {
        print("Init view")
        super.init(frame: CGRect.zero)
        
        initUI()
        initLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
        addSubview(stackView)
        stackView.addArrangedSubview(setTitleText)
        stackView.addArrangedSubview(setDescriptionText)
        addSubview(backButton)
    }
    
    private func initLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 250),
            setTitleText.heightAnchor.constraint(equalToConstant: 50),
            setDescriptionText.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}

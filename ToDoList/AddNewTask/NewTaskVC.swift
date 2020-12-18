//
//  NewTaskVC.swift
//  ToDoList
//
//  Created by Динара Аминова on 17.12.2020.
//

import UIKit

class NewTaskVC: UIViewController {
    //MARK: - Property
    private let mainView = NewTaskView()
    private var viewModel: NewTaskViewModel
    
    //MARK: - Life cycle
    init(viewModel: NewTaskViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        mainView.setTitleText.delegate = self
        mainView.setDescriptionText.delegate = self
        
        mainView.backButton.addAction(UIAction { [unowned self] _ in
            self.backButtonAction()
        }, for: .touchUpInside)
    }
    
    private func backButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

//MARK: - TextFieldDelegate
extension NewTaskVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case mainView.setTitleText:
            mainView.setDescriptionText.becomeFirstResponder()
        case mainView.setDescriptionText:
            guard mainView.setTitleText.text?.isEmpty == false else { return false }
            self.viewModel.saveToDoTask(title: mainView.setTitleText.text ?? "",
                                        description: mainView.setDescriptionText.text ?? "")
            backButtonAction()
        default:
            backButtonAction()
            break
        }
        return true
    }
}

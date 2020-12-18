//
//  DescriptionVC.swift
//  ToDoList
//
//  Created by Динара Аминова on 16.12.2020.
//

import UIKit

class DescriptionVC: UIViewController {
    private let mainView = DescriptionView()
    private var viewModel: DescriptionViewModel
    
    //MARK: - Life cycle
    init(viewModel: DescriptionViewModel) {
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
        super.viewDidLoad()
        
        mainView.configureWith(model: viewModel.model)
        
        mainView.closeButton.addAction(UIAction { [unowned self] _ in
            self.closeButtonAction()
        }, for: .touchUpInside)
        
        mainView.doneButton.addAction(UIAction { [unowned self] _ in
            self.doneButtonAction()
        }, for: .touchUpInside)
    }
    
    //MARK: - Actions
    private func closeButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    private func doneButtonAction() {
        viewModel.changeTaskStatus()
        closeButtonAction()
    }
}

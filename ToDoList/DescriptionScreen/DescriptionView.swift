//
//  DescriptionView.swift
//  ToDoList
//
//  Created by Динара Аминова on 17.12.2020.
//

import UIKit

class DescriptionView: UIView {
    //MARK: - UI
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 250/255, green: 128/255, blue: 114/255, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 250/255, green: 128/255, blue: 114/255, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let completedTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 250/255, green: 128/255, blue: 114/255, alpha: 1)
        label.textAlignment = .center
//        label.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.backgroundColor = UIColor(red: 250/255, green: 128/255, blue: 114/255, alpha: 0.8)
        button.tintColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.setTitleColor(UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 250/255, green: 128/255, blue: 114/255, alpha: 0.8)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Init
    init() {
        super.init(frame: CGRect.zero)
        
        initUI()
        initLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        addSubview(descriptionLabel)
        addSubview(titleLabel)
        addSubview(closeButton)
        addSubview(doneButton)
        addSubview(completedTimeLabel)
    }
    
    private func initLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            doneButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            doneButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            completedTimeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            completedTimeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    // MARK: - Configure
    func configureWith(model: RealmModel) {
        titleLabel.text = model.taskName
        descriptionLabel.text = model.taskDescription
        completedTimeLabel.text = "completed at  \(model.timeWhenCompleted)\n\(model.dateWhenCompleted)"
        
        if model.isDone {
            doneButton.isHidden = true
            completedTimeLabel.isHidden = false
            backgroundColor = UIColor(red: 127/255, green: 255/255, blue: 212/255, alpha: 1)
        } else {
            backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
            doneButton.isHidden = false
            completedTimeLabel.isHidden = true
        }
    }
}

//
//  ListCell.swift
//  ToDoList
//
//  Created by Динара Аминова on 15.12.2020.
//

import UIKit

class ListCell: UITableViewCell {
    //MARK: - Property
    static var cellID: String { return String(describing: self) }
    
    //MARK: - UI
    private var cellContentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.contentMode = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 250/255, green: 128/255, blue: 114/255, alpha: 1)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 250/255, green: 128/255, blue: 114/255, alpha: 1)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initUI()
        initLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        backgroundColor = .clear
        addSubview(cellContentView)
        cellContentView.addSubview(titleLabel)
        cellContentView.addSubview(descriptionLabel)
    }
    
    private func initLayout() {
        NSLayoutConstraint.activate([
            cellContentView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            cellContentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cellContentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cellContentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: 7),
            titleLabel.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -7)
        ])
    }
    
    // MARK: - Configure
    func configureCellWith(model: RealmModel) {
        titleLabel.text = model.taskName
        descriptionLabel.text = model.taskDescription
        
        switch model.isDone {
        case true:
            cellContentView.backgroundColor = UIColor(red: 127/255, green: 255/255, blue: 212/255, alpha: 0.4)
        case false:
            cellContentView.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 0.4)
        }
    }
}

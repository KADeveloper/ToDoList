//
//  ListVC.swift
//  ToDoList
//
//  Created by Динара Аминова on 15.12.2020.
//

import UIKit
import RealmSwift

class ListVC: UIViewController {
    private let mainView = ListView()
    private var viewModel = ListViewModel()
    
    // MARK: - Life cycle
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Welcome"
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        
        mainView.refreshControl.addTarget(self, action: #selector(refreshPhotoList), for: .valueChanged)
        mainView.addButton.addAction(UIAction { [unowned self] _ in
            self.addNewTask()
        }, for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainView.tableView.reloadData()
    }
    
    // MARK: - Actions
    @objc private func refreshPhotoList() {
        mainView.tableView.reloadData()
        mainView.refreshControl.endRefreshing()
    }
    
    private func addNewTask() {
        let vc = NewTaskVC(viewModel: NewTaskViewModel())
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true, completion: nil)
    }
}

//MARK: - TableViewDataSource, TableViewDelegate
extension ListVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.taskTypeNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.activeTasks().count
        }
        return viewModel.completedTasks().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.cellID,
                                                       for: indexPath) as? ListCell else {
            return ListCell()
        }

        switch indexPath.section {
            case 0:
                cell.configureCellWith(model: viewModel.activeTasks()[indexPath.row])
            case 1:
                cell.configureCellWith(model: viewModel.completedTasks()[indexPath.row])
            default:
                break
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var model = RealmModel()
        switch indexPath.section {
        case 0:
            model = viewModel.activeTasks()[indexPath.row]
        case 1:
            model = viewModel.completedTasks()[indexPath.row]
        default:
            break
        }
        let vc = DescriptionVC(viewModel: DescriptionViewModel(model: model))
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            switch indexPath.section {
            case 0:
                viewModel.delete(task: viewModel.activeTasks()[indexPath.row])
            case 1:
                viewModel.delete(task: viewModel.completedTasks()[indexPath.row])
            default:
                break
            }
            tableView.deleteRows(at: [indexPath], with: .bottom)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return viewModel.taskTypeNames[0]
        case 1:
            return viewModel.taskTypeNames[1]
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        switch section {
        case 0:
            view.tintColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
            let header = view as? UITableViewHeaderFooterView
            header?.textLabel?.textColor = .red
        case 1:
            view.tintColor = UIColor(red: 127/255, green: 255/255, blue: 212/255, alpha: 1)
            let header = view as? UITableViewHeaderFooterView
            header?.textLabel?.textColor = .red
        default:
            return
        }
    }
}

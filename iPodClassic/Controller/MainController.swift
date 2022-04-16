//
//  MainController.swift
//  iPodClassic
//
//  Created by Ronan Mak on 13/4/2022.
//

import UIKit

private let reuseIdentifier = "CategoryCell"

class MainController: UIViewController {
    
    private enum Dimen {
    }
    
    // MARK: - Properties
    
    private let upperHalfView: UpperHalfView = {
        let view = UpperHalfView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
//        table.isScrollEnabled = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CategoryCell.self, forCellReuseIdentifier: reuseIdentifier)
        return table
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupTableView()
        self.tableView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
    }
    

    // MARK: - style
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.frame
        
// 自適應高度的TableView
//        tableView.estimatedRowHeight = 0
//        tableView.estimatedSectionHeaderHeight = 0
//        tableView.estimatedSectionFooterHeight = 0
                tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width / 2, height: view.bounds.size.height / 2)
//        tableView.frame.size.width = CGFloat(view.bounds.size.width / 2)
// cell邊線
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        tableView.tableHeaderView?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
//        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90).isActive = true
    }

// 自適應高度的TableView
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        tableView.layer.removeAllAnimations()
        tableView.frame.size.height = tableView.contentSize.height
        UIView.animate(withDuration: 0.5) {
            self.updateViewConstraints()
        }
    }
}

// MARK: - UITableViewDataSource

extension MainController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CategoryCell
        //        cell.textLabel?.text = "ronan \(indexPath.section) | row:\(indexPath.row)"
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainController: UITableViewDelegate {
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return "section title \(section)"
    //    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UpperHalfView()
        return header
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return tableView.estimatedRowHeight
//    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//    }
}

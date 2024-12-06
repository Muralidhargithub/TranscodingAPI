//
//  CustomTableView.swift
//  APIDataTableViewCell
//
//  Created by Muralidhar reddy Kakanuru on 12/2/24.
//

import UIKit

class CustomTableView: UIView {
//    private var data : [User] = []
//    private let gitDataservice: GitData = DataGit.shared
    private var data : [Content] = []
    private let gitDataservice: GitData = DataGit.shared
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        fetchData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addSubview(tableView)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        //tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
    
//    func fetchData(){
//        let url = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
//        gitDataservice.getData(url: url) { [weak self] result in
//            self?.data = result
//            if let data = self?.data{
//                self?.tableView.reloadData()
//            }
//        }
//    }
    func fetchData(){
        let url = "https://gist.githubusercontent.com/dbackeus/484315/raw/dfeb530f9619bb74af5d537280a0b3b305410d01/videos.json"
        gitDataservice.getData(url: url) { [weak self] result in
            self?.data = result
            if let data = self?.data{
                self?.tableView.reloadData()
            }
        }
    }
}

extension CustomTableView : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(with: data[indexPath.row])
        return cell
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            guard section < data.count else { return nil }
            let content = data[section]
            
            return """
            Title: \(content.title ?? "N/A") | Duration: \(content.duration ?? 0) seconds \n
            
"""
        }
}





//
//  ViewController.swift
//  PresentPopOver
//
//  Created by 3 Embed on 18/05/19.
//  Copyright © 2019 3 Embed. All rights reserved.
//



import UIKit

class MainVc: UIViewController,UIGestureRecognizerDelegate{
    
    fileprivate let reuseableCellId = "CellId"
    
//    var presented:Bool = false
    
    override func loadView() {
        super.loadView()
        addSuViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0..<10 {
            dummyArr.append(0)
        }
        loadtableData()
    }

//    lazy var transperantView:UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .clear
//        return view
//    }()
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.white;
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func addSuViews(){
        view.backgroundColor = .white
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
    }
    
    private func loadtableData(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: reuseableCellId)
        
    }
    
    @objc func presentTable(sender:UIButton){
        print(sender.tag)
        
        
        if dummyArr[sender.tag] == 0 {
            dummyArr.removeAll()
            for _ in 0..<10 {
                dummyArr.append(0)
            }
            dummyArr[sender.tag] = 1
            tableView.reloadData()
        } else{
            dummyArr.removeAll()
            for _ in 0..<10 {
                dummyArr.append(0)
            }
            dummyArr[sender.tag] = 0
            tableView.reloadData()
        }
        
    }
//    func addGesture(){
//        let tap = UITapGestureRecognizer(target: self, action: #selector(gestureView))
//        tap.delegate = self
//        transperantView.addGestureRecognizer(tap)
//
//    }
//
//    @objc func gestureView(){
//        presented = true
//        tableView.reloadData()
//        transperantView.removeFromSuperview()
//    }

}

extension MainVc:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseableCellId, for: indexPath) as? CustomCell else{return UITableViewCell()}
        
        cell.selectionStyle = .none
        cell.moreButton.tag = indexPath.row
        cell.moreButton.addTarget(self, action: #selector(presentTable(sender:)), for: .touchUpInside)
        if dummyArr[indexPath.row] == 1 {
            cell.addTableView()
        } else{
            cell.removeTableView()
        }
//        if presented{
//            cell.removeTableView()
//        }
//        cell.delegate = self
        return cell
    }
    
    
}

//extension MainVc:MenuDelegate{
//    func handleMenu() {
//        addTransperantView()
////        print("Handler Caleed")
//
//    }
//
//     func addTransperantView(){
//        view.addSubview(transperantView)
//        NSLayoutConstraint.activate([
//            transperantView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
//            transperantView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            transperantView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            transperantView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
//            ])
//        addGesture()
//    }
//
//
//
//}

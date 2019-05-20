//
//  CustomCell.swift
//  PresentPopOver
//
//  Created by 3 Embed on 18/05/19.
//  Copyright © 2019 3 Embed. All rights reserved.
//

import UIKit
//
//protocol MenuDelegate:AnyObject {
//    func handleMenu()
//}

class CustomCell: UITableViewCell {

//     weak var delegate:MenuDelegate?
    
    fileprivate let records = ["Edit","Delete"]
    fileprivate let reuseId = "CellId"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addCellViews()
        loadTable()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var backGroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowOpacity = 10
        return view
    }()
    
    lazy var moreButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 0
        button.setTitle("…", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
//        button.titleLabel?.textAlignment = .center
//        button.addTarget(self, action: #selector(presentTableView(sender:)), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 25)
        
        return button
    }()
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 8
        
        tableView.layer.borderWidth = 0.1
        
        tableView.tableFooterView = UIView(frame: .zero)
        return tableView
    }()
    
    private func addCellViews(){
        self.addSubview(backGroundView)
        NSLayoutConstraint.activate([
            backGroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            backGroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backGroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            backGroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
            ])
        backGroundView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        backGroundView.addSubview(moreButton)
        NSLayoutConstraint.activate([
            moreButton.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 15),
            moreButton.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: 5),
            moreButton.widthAnchor.constraint(equalToConstant: 25),
            moreButton.heightAnchor.constraint(equalToConstant: 15)
            ])
        moreButton.transform = CGAffineTransform(rotationAngle: .pi/2)
        tableView.layer.shadowColor = UIColor.lightGray.cgColor
        tableView.layer.shadowRadius = 8
        tableView.layer.shadowOffset = CGSize.zero
        tableView.layer.shadowOpacity = 10
        
    }
    
//    @objc func presentTableView(sender:UIButton){
//        delegate?.handleMenu()
////        sender.tag == 0 ? addTableView() : removeTableView()
//        addTableView()
//    }
  
    private func loadTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseId)
    }
    
    
     func addTableView(){
//       moreButton.tag = 1
        backGroundView.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: moreButton.bottomAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -10),
            tableView.widthAnchor.constraint(equalToConstant: 150),
            tableView.heightAnchor.constraint(equalToConstant: 100)
            ])
//        moreButton.tag = 1
    }
    func removeTableView(){
        tableView.removeFromSuperview()
//        moreButton.tag = 0
    }
}


extension CustomCell:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath)
        cell.textLabel?.text = records[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name: "Avenirnext-Medium", size: 20)
        return cell
    }
}

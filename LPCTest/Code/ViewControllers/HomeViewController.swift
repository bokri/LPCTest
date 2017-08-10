//
//  HomeViewController.swift
//  LPCTest
//
//  Created by Aymen Bokri on 09/08/2017.
//  Copyright © 2017 Saif Chaouachi. All rights reserved.
//

import UIKit
import Reusable
import RxSwift

final class HomeViewController: ViewController {
    
    // MARK : - Properties
    
    @IBOutlet var tableView: UITableView!
    
    
    // MARK - Constants and variables
    
    static private let cellIdentifier = "PotCell"
    let refreshControl = UIRefreshControl()
    var datasource = [Pot]()
    fileprivate let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set View controller title
        self.title = L10n.appName.string
        
        self.tableView.register(cellType: PotCell.self)
        
        self.attachPullToRefresh()
        
        tableView.rowHeight = 200.0
        
        
        fetchPots()
    }
    
    
    // MARK : - Methods
    
    func attachPullToRefresh() {
        refreshControl.addTarget(self, action: #selector(HomeViewController.pullToRefresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    func pullToRefresh() {
        
        fetchPots()
        
        refreshControl.endRefreshing()
        
    }
    
    
    func fetchPots() {
        
        ApiClient.shared.pots()
            .subscribe(
                onNext: { [weak self] pots in
                    if (pots.count>0) {
                        print("fetching data from internet")
                        
                        self?.datasource = pots
                        self?.tableView.reloadData()
                        
                    } else {
                        print("error fetching data from internet") // It must show to the user the warning page
                        
                        //  self?.errorView.isHidden = false
                        
                    }
                },
                onError: { (error) in
                    debugPrint(error)
            })
            .disposed(by: disposeBag)
    }
    
    
    
    func getPot(_ row : Int) -> Pot{
        return datasource[row]
    }
    
    
    // MARK : - Actions
    
    @IBAction func addPot(_ sender: UIBarButtonItem) {
        
        //    ApiClient.shared.createPot {
        //        //TODO
        //    }
    }
    
    @IBAction func removePot(_ sender: UIBarButtonItem) {
        
        //   ApiClient.shared.removePot {
        //       //TODO
        //   }
        
        
    }
    
    
    
    
}

// MARK : - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    
}

// MARK : - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: PotCell.self)
        
        let pot = getPot(indexPath.row)
        
        cell.configureCellFor(pot: pot)
        
        return cell
    }
    
}




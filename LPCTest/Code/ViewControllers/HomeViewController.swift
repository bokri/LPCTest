//
//  HomeViewController.swift
//  LPCTest
//
//  Created by Aymen Bokri on 09/08/2017.
//  Copyright © 2017 Saif Chaouachi. All rights reserved.
//

import UIKit

final class HomeViewController: ViewController {
    
    // MARK : - Properties
    @IBOutlet var tableView: UITableView!
    
    
    // MARK - Constants and variables
    static private let cellIdentifier = "PotCell"
    let refreshControl = UIRefreshControl()
    var pots = [Pot]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set View controller title
        self.title = L10n.appName.string
        
        self.tableView.register(cellType: PotCell.self)
        
        self.attachPullToRefresh()
        
        
        
        //TODO
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 211;
        
        fetchPots()
    }
    
    func attachPullToRefresh() {
        refreshControl.addTarget(self, action: #selector(HomeViewController.pullToRefresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    func pullToRefresh() {
        
        fetchPots()
        refreshControl.endRefreshing()
        
    }
    
    
    func fetchPots(){
        
        ApiClient.shared.pots(success: { (pots) in
            //TODO
        }) {
            //TODO
        }
        
    }
    
    func getPot(_ row : Int) -> Pot{
        return pots[row]
    }
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        
        ApiClient.shared.pots(success: { (pots) in
            //TODO
        }) {
            //TODO
        }
        
        
    }
    
    
    @IBAction func addPot(_ sender: UIBarButtonItem) {
        
        ApiClient.shared.createPot {
            //TODO
        }
    }
    
    @IBAction func removePot(_ sender: UIBarButtonItem) {
        
        ApiClient.shared.removePot {
            //TODO
        }
        
        
    }




}

// MARK : - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {


    

}

// MARK : - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = PotCell()
        
        let pot = getPot(indexPath.row)
        
        cell.configureCellFor(pot: pot)
        
        return cell
    }

}
    



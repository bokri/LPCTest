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
        
        var title : String! //TODO
        self.navigationController?.navigationBar.topItem?.title = title
        
        self.refreshControl.addTarget(self,
                                       action: #selector(handleRefresh(refreshControl:
                                        )),
                                       for: UIControlEvents.valueChanged)
        
        
        
        //TODO
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 211;
        
        fetchPots()
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

extension HomeViewController: UITableViewDelegate {


    

}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //TODO
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : PotCell!  //TODO
        
        let pot = getPot(indexPath.row)
        
        cell.configureCellFor(pot: pot)
        
        return cell
    }

}
    



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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cancelNavBarButton: UIBarButtonItem!
    @IBOutlet weak var addNavBarButton: UIBarButtonItem!
    @IBOutlet weak var errorView: ErrorView!
    
    // MARK - Constants and variables
    
    static private let cellIdentifier = "PotCell"
    let refreshControl = UIRefreshControl()
    let potViewModel = PotViewModel()
    fileprivate let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set View controller title
        self.title = L10n.appName.string
        
        self.tableView.register(cellType: PotCell.self)
        
        self.attachPullToRefresh()
        
        tableView.rowHeight = 200.0
        
        self.potViewModel.pots.asObservable().subscribe(onNext: { [weak self] (pots) in
            print (pots.count)
            if(pots.count > 0) {
                self?.addNavBarButton.isEnabled = true
                self?.errorView.isHidden = true
                
                if(pots.count < 2) {
                    // Disable the Cancel button
                    self?.cancelNavBarButton.isEnabled = false
                }else {
                    self?.cancelNavBarButton.isEnabled = true
                }
            } else {
                // Show error page
                self?.cancelNavBarButton.isEnabled = false
                self?.addNavBarButton.isEnabled = false
                self?.errorView.isHidden = false
            }
            
        }, onError: { (error) in
            print(error)
        }).disposed(by: self.disposeBag)
    
        self.fetchPots()
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
        
        potViewModel.getPots().subscribe(onNext: { [weak self] (pots) in
            self?.tableView.reloadData()
        }, onError: { (error) in
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    
    
    func getPot(_ row : Int) -> Pot {
        return potViewModel.pots.value[row]
    }
    
    
    // MARK : - Actions
    
    @IBAction func addPot(_ sender: UIBarButtonItem) {

        potViewModel.createPot().subscribe(onCompleted: {
            ApiClient.shared.pots().subscribe(onNext: { [weak self] pots in
                if let pot = pots.last {
                    self?.potViewModel.pots.value.insert(pot, at: 1)
                    
                    self?.tableView.beginUpdates()
                    
                    self?.tableView.insertRows(at: [IndexPath(row: 1, section: 0)], with: UITableViewRowAnimation.top)
                    
                    self?.tableView.endUpdates()
                    
                    
                }
            })
        }).disposed(by: disposeBag)
        
    }
    
    @IBAction func removePot(_ sender: UIBarButtonItem) {
        
        potViewModel.removePot().subscribe(onNext: { [weak self] (Any) in
            
            if (self?.potViewModel.pots.value.count)! > 1 {
                
                self?.potViewModel.pots.value.remove(at: 1)
                
                self?.tableView.beginUpdates()
                
                self?.tableView.deleteRows(at: [IndexPath(row: 1, section: 0)], with: UITableViewRowAnimation.bottom)
                
                self?.tableView.endUpdates()
            }
        }).disposed(by: disposeBag)
        
    }
    
    
    
    
}

// MARK : - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    
}

// MARK : - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return potViewModel.pots.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: PotCell.self)
        
        let pot = getPot(indexPath.row)
        
        cell.configureCellFor(pot: pot)
        
        return cell
    }
    
}




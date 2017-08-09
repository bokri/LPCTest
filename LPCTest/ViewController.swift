import UIKit

class ViewController: UITableViewController {

   static private let cellIdentifier = "PotCell"

  var pots = [Pot]()

  override func viewDidLoad() {
    super.viewDidLoad()

    var title : String! //TODO
    self.navigationController?.navigationBar.topItem?.title = title

    self.refreshControl?.addTarget(self,
                                   action: #selector(handleRefresh(refreshControl:
                                    )),
                                   for: UIControlEvents.valueChanged)



    //TODO 
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 211;

    fetchPots()
  }



  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    //TODO

    return 0
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    var cell : PotCell!  //TODO

    let pot = getPot(indexPath.row)

    cell.configureCellFor(pot: pot)

    return cell
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


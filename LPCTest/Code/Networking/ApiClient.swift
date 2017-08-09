import Foundation
class ApiClient {

  static let shared = ApiClient()
  
  static let baseUrl = "https://recrutement.lepotcommuntest.fr/recruting/"

  //TODO

   func pots( success successCompletion: ((_ pots: [Pot]) -> Void)!,
                   failure failureCompletion: (() -> Void)!){

    //TODO
  }

  func createPot(
             completion: (() -> Void)!){
    //TODO

     }

  func removePot(
    completion: (() -> Void)!){

    //TODO
  }

}

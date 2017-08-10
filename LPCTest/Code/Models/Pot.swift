import Foundation

class Pot {

  var  name : String = ""
  var  imageUrl : String? = ""

    func initialize(name: String, imageUrl: String = "") {
    
        self.name = name
        self.imageUrl = imageUrl
        
    }
  
}

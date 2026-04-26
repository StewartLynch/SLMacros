import SLMacros
import Foundation


let s = "https://www.createchsol.com"
//let url = #URL(s)
let url = #URL("https://createchsol.com")
print(url)

@CaseIdentifiable
enum Screen {
    case home, settings
    case profile(userID: Int)
    
    var title: String {
        "Some Title"
    }
    
    func show() {
        
    }
}

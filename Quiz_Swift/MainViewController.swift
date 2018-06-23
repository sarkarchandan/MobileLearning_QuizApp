import UIKit

@objc(MainViewController)
class MainViewController: UIViewController {
    
    @IBOutlet
    weak var questionLabel: UILabel!
    
    @IBOutlet
    weak var scoreLabel: UILabel!
    
    @IBOutlet
    weak var progressView: UIView!
    
    @IBOutlet
    weak var progressLabel: UILabel!
    
    @IBAction
    func buttonPressed(_ sender: UIButton)  {
        print("Swift Button Pressed: \(sender.currentTitle ?? "")")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


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
        if sender.tag == 1 {
            pickedAnswer = true
        }else {
            pickedAnswer = false
        }
        checkAnswer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questionBank.questions[0].questionText
    }
    
    private func checkAnswer() {
        if pickedAnswer == questionBank.questions[0].answer {
            print("Correct Answer")
        }else {
            print("wrong Answer")
        }
    }
    
    private let questionBank = QuestionBank()
    private var pickedAnswer = false
}


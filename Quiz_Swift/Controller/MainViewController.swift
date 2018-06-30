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
        questionNumber += 1
        loadNextQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNextQuestion()
    }
    
    private func loadNextQuestion(){
        guard questionNumber < questionBank.questions.count else {
            createEndOfQuizAlert()
            return
        }
        questionLabel.text = questionBank.questions[questionNumber].questionText
    }
    
    private func createEndOfQuizAlert(){
        let alert = UIAlertController(title: "End of Quiz", message: "The Quiz has ended, do you want to start over", preferredStyle: .alert)
        let action = UIAlertAction(title: "Restart", style: .default) {[unowned self] _ in
            self.questionNumber = 0
            self.loadNextQuestion()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func checkAnswer() {
        guard questionNumber < questionBank.questions.count else { return }
        if pickedAnswer == questionBank.questions[questionNumber].answer {
            print("Correct Answer")
        }else {
            print("wrong Answer")
        }
    }
    
    private let questionBank = QuestionBank()
    private var pickedAnswer = false
    private var questionNumber = 0
}


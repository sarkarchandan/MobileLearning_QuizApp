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
        self.prepareUI()
        self.loadNextQuestion()
    }
    
    private func loadNextQuestion(){
        guard questionNumber < questionBank.questions.count else {
            restartQuiz()
            return
        }
        questionLabel.text = questionBank.questions[questionNumber].questionText
        self.updateProgress()
    }
    
    private func restartQuiz(){
        let alert = UIAlertController(title: "End of Quiz", message: "The Quiz has ended, do you want to start over", preferredStyle: .alert)
        let action = UIAlertAction(title: "Restart", style: .default) {[unowned self] _ in
            self.questionNumber = 0
            self.prepareUI()
            self.loadNextQuestion()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func checkAnswer() {
        guard questionNumber < questionBank.questions.count else { return }
        if pickedAnswer == questionBank.questions[questionNumber].answer {
            self.score += 1
            self.updateScore()
        }else {
            print("wrong Answer")
        }
    }
    
    private func prepareUI(){
        self.score = 0
        self.scoreLabel.text = "Score: \(score)"
        self.progressLabel.text = "\(self.questionNumber + 1) / \(self.questionBank.questions.count)"
    }
    
    private func updateScore(){
        self.scoreLabel.text = "Score: \(score)"
    }
    
    private func updateProgress(){
        self.progressLabel.text = "\(self.questionNumber + 1) / \(self.questionBank.questions.count)"
        self.progressView.frame.size.width = (self.view.frame.size.width / 13) * CGFloat(self.questionNumber + 1)
    }
    
    private let questionBank = QuestionBank()
    private var pickedAnswer = false
    private var questionNumber = 0
    private var score = 0
}


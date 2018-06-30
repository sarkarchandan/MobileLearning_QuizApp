import Foundation

struct Question {
    
    init(questionText: String, answer: Bool) {
        self.questionText = questionText
        self.answer = answer
    }
    
    let questionText: String
    let answer: Bool
}

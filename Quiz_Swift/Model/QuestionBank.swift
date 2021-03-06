import Foundation

class QuestionBank {
    
    init() {
        questions.append(Question(questionText: "Valentine\'s day is banned in Saudi Arabia.", answer: true))
        
        questions.append(Question(questionText: "A slug\'s blood is green.", answer: true))
        
        questions.append(Question(questionText: "Approximately one quarter of human bones are in the feet.", answer: true))
        
        questions.append(Question(questionText: "The total surface area of two human lungs is approximately 70 square metres.", answer: true))
        
        questions.append(Question(questionText: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: true))
        
        questions.append(Question(questionText: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: false))
        
        questions.append(Question(questionText: "It is illegal to pee in the Ocean in Portugal.", answer: true))
        
        questions.append(Question(questionText: "You can lead a cow down stairs but not up stairs.", answer: false))
        
        questions.append(Question(questionText: "Google was originally called \"Backrub\".", answer: true))
        
        questions.append(Question(questionText: "Buzz Aldrin\'s mother\'s maiden name was \"Moon\".", answer: true))
        
        questions.append(Question(questionText: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: false))
        
        questions.append(Question(questionText: "No piece of square dry paper can be folded in half more than 7 times.", answer: false))
        
        questions.append(Question(questionText: "Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.", answer: true))
    }
    
    var questions: [Question] = []
}

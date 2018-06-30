#import "QuestionBank.h"
#import "Question.h"

@implementation QuestionBank
{
    NSMutableArray<Question*>* _questions;
}

-(instancetype)init
{
    if(self = [super init])
    {
        _questions = [NSMutableArray new];
        [_questions addObject:[[Question alloc] initWithQuestionText:@"Valentine\'s day is banned in Saudi Arabia." andAnswer:YES]];
        [_questions addObject:[[Question alloc] initWithQuestionText:@"A slug\'s blood is green." andAnswer:YES]];
        [_questions addObject:[[Question alloc] initWithQuestionText:@"Approximately one quarter of human bones are in the feet." andAnswer:YES]];
        [_questions addObject:[[Question alloc] initWithQuestionText:@"The total surface area of two human lungs is approximately 70 square metres." andAnswer:YES]];
        [_questions addObject:[[Question alloc] initWithQuestionText:@"In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat." andAnswer:YES]];
        [_questions addObject:[[Question alloc] initWithQuestionText:@"In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place." andAnswer:NO]];
        [_questions addObject:[[Question alloc] initWithQuestionText:@"It is illegal to pee in the Ocean in Portugal." andAnswer:YES]];
        [_questions addObject:[[Question alloc] initWithQuestionText:@"You can lead a cow down stairs but not up stairs." andAnswer:NO]];
        [_questions addObject:[[Question alloc] initWithQuestionText:@"Google was originally called \"Backrub\"." andAnswer:YES]];
        [_questions addObject:[[Question alloc] initWithQuestionText:@"Buzz Aldrin\'s mother\'s maiden name was \"Moon\"." andAnswer:YES]];
        [_questions addObject:[[Question alloc] initWithQuestionText:@"The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant." andAnswer:NO]];
        [_questions addObject:[[Question alloc] initWithQuestionText:@"No piece of square dry paper can be folded in half more than 7 times." andAnswer:NO]];
        [_questions addObject:[[Question alloc] initWithQuestionText:@"Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog." andAnswer:YES]];
    }
    return self;
}

- (NSArray<Question *> *)questions
{
    return _questions;
}


@end

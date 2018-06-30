#import "Question.h"

@implementation Question

- (instancetype)initWithQuestionText:(NSString *)text andAnswer:(BOOL)answer
{
    if(self = [super init])
    {
        _questionText = text;
        _answer = answer;
    }
    return self;
}

@end

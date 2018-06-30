#import <Foundation/Foundation.h>

@class Question;

@interface QuestionBank : NSObject

@property (nonatomic,readonly) NSArray<Question*>* questions;

@end

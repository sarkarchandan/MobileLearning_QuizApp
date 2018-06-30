#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic,readonly) NSString* questionText;
@property (nonatomic,readonly) BOOL answer;
-(instancetype) initWithQuestionText: (NSString*) text
                           andAnswer: (BOOL) answer;

@end

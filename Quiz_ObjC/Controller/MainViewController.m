#import "MainViewController.h"
#import "QuestionBank.h"
#import "Question.h"

@interface MainViewController ()
@property(nonatomic,weak) IBOutlet UILabel* questionLabel;
@property(nonatomic,weak) IBOutlet UILabel* scoreLabel;
@property(nonatomic,weak) IBOutlet UIView* progressView;
@property(nonatomic,weak) IBOutlet UILabel* progressLabel;
@property(nonatomic)NSInteger questionNumber;
@property(nonatomic)QuestionBank* questionBank;
@property(nonatomic)BOOL pickedAnswer;
@end

@implementation MainViewController

-(IBAction)buttonPressed:(UIButton*)sender
{
    if([sender tag] == 1)
    {
        [self setPickedAnswer:YES];
    }else
    {
        [self setPickedAnswer:NO];
    }
    [self checkAnswer];
    _questionNumber += 1;
    [self loadNextQuestion];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _questionBank = [[QuestionBank alloc] init];
    [self setPickedAnswer:NO];
    [self setQuestionNumber:0];
    [self loadNextQuestion];
}

-(void)loadNextQuestion
{
    if ([self questionNumber] < [[[self questionBank] questions] count])
    {
        [[self questionLabel] setText: [[[[self questionBank] questions]objectAtIndex:_questionNumber]questionText]];
    }else
    {
        [self createEndOfQuizAlert];
    }
}

-(void)createEndOfQuizAlert
{
    __weak typeof(self) weakSelf = self;
    UIAlertController* controller = [UIAlertController alertControllerWithTitle:@"End of Quiz" message:@"The Quiz has been ended, do you want to start over" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* restartAction = [UIAlertAction actionWithTitle:@"Restart" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                                    {
                                        [weakSelf setQuestionNumber:0];
                                        [weakSelf loadNextQuestion];
                                    }];
    [controller addAction:restartAction];
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)checkAnswer
{
    if([self pickedAnswer] == [[[[self questionBank] questions]objectAtIndex:[self questionNumber]]answer])
    {
        NSLog(@"Correct Answer");
    }else
    {
        NSLog(@"Wrong Answer");
    }
    
}

@end

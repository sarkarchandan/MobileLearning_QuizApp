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
@property(nonatomic)NSInteger score;
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
    [self prepareUI];
    [self setQuestionNumber:0];
    [self loadNextQuestion];
}

-(void)loadNextQuestion
{
    if ([self questionNumber] < [[[self questionBank] questions] count])
    {
        [[self questionLabel] setText: [[[[self questionBank] questions]objectAtIndex:_questionNumber]questionText]];
        [self updateProgress];
    }else
    {
        [self restartQuiz];
    }
}

-(void)restartQuiz
{
    __weak typeof(self) weakSelf = self;
    UIAlertController* controller = [UIAlertController alertControllerWithTitle:@"End of Quiz" message:@"The Quiz has been ended, do you want to start over" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* restartAction = [UIAlertAction actionWithTitle:@"Restart" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                                    {
                                        [weakSelf setQuestionNumber:0];
                                        [weakSelf prepareUI];
                                        [weakSelf loadNextQuestion];
                                    }];
    [controller addAction:restartAction];
    [self presentViewController:controller animated:YES completion:nil];
}

-(void) prepareUI
{
    _score = 0;
    [[self scoreLabel] setText: [NSString stringWithFormat:@"%@: %ld",@"Score",[self score]]];
    [[self progressLabel] setText: [NSString stringWithFormat:@"%ld / %ld",[self questionNumber]+1,[[[self questionBank] questions]count]]];
}

-(void)updateScore
{
    _score += 1;
    [[self scoreLabel] setText: [NSString stringWithFormat:@"%@: %ld",@"Score",[self score]]];
}

-(void)updateProgress
{
    [[self progressLabel] setText: [NSString stringWithFormat:@"%ld / %ld",[self questionNumber]+1,[[[self questionBank] questions]count]]];
    CGRect progressViewFrame = [[self progressView] frame];
    progressViewFrame.size.width = ([[self view] frame].size.width / 13) * (CGFloat)([self questionNumber] + 1);
    [[self progressView] setFrame:progressViewFrame];
}

-(void)checkAnswer
{
    if([self pickedAnswer] == [[[[self questionBank] questions]objectAtIndex:[self questionNumber]]answer])
    {
        [self updateScore];
    }else
    {
        NSLog(@"Wrong Answer");
    }
}

@end

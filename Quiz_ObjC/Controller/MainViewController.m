#import "MainViewController.h"
#import "QuestionBank.h"
#import "Question.h"

@interface MainViewController ()
@property(nonatomic,weak) IBOutlet UILabel* questionLabel;
@property(nonatomic,weak) IBOutlet UILabel* scoreLabel;
@property(nonatomic,weak) IBOutlet UIView* progressView;
@property(nonatomic,weak) IBOutlet UILabel* progressLabel;
@end

@implementation MainViewController
{
    QuestionBank* questionBank;
    BOOL pickedAnswer;
}

-(IBAction)buttonPressed:(UIButton*)sender
{
    if([sender tag] == 1)
    {
        pickedAnswer = YES;
    }else
    {
        pickedAnswer = NO;
    }
    [self checkAnswer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    questionBank = [[QuestionBank alloc] init];
    pickedAnswer = NO;
    [[self questionLabel] setText: [[[questionBank questions]firstObject]questionText]];
}

-(void)checkAnswer
{
    if(pickedAnswer == [[[questionBank questions]firstObject]answer])
    {
        NSLog(@"Correct Answer");
    }else
    {
        NSLog(@"Wrong Answer");
    }
}

@end

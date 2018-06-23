#import "MainViewController.h"

@interface MainViewController ()
@property(nonatomic,weak) IBOutlet UILabel* questionLabel;
@property(nonatomic,weak) IBOutlet UILabel* scoreLabel;
@property(nonatomic,weak) IBOutlet UIView* progressView;
@property(nonatomic,weak) IBOutlet UILabel* progressLabel;
@end

@implementation MainViewController

-(IBAction)buttonPressed:(UIButton*)sender
{
    NSLog(@"ObjC Button Pressed: %@",[sender currentTitle]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end

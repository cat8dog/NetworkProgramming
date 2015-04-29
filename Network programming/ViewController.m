#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // create the textfield
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 60, 280, 20)];
    self.textField.text = @"AAPL";
    [self.view addSubview:_textField];
    // create the label
    self.myLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 280, 40)];
    self.myLabel.text = @"$0.0";
    [self.view addSubview:_myLabel];
    // create the button
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    myButton.frame = CGRectMake(20, 200, 280, 40);
    [myButton setTitle:@"Get Quote" forState:UIControlStateNormal];
    [myButton addTarget:self action:@selector(getQuote) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myButton];
    
}

-(void)getQuote {
   
    NSString *quoteAddress = [NSString stringWithFormat:@"http://download.finance.yahoo.com/d/quotes.csv?s=%@&f=sl1d1t1c1ohgv&e=.csv",_textField.text];
    NSURL *theURL = [[NSURL alloc] initWithString:[quoteAddress stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    NSURLRequest *theRequest = [[NSURLRequest alloc] initWithURL:theURL];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&response error:&error];
    NSMutableString *contentString = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSArray *arrayData = [contentString componentsSeparatedByString:@","];
    _myLabel.text = [arrayData objectAtIndex:1];
    NSLog(@"%@",contentString);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

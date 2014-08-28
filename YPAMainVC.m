//
//  YPAMainVC.m
//  YelpApp
//
//  Created by Savitha Reddy on 8/26/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "YPAMainVC.h"
#import  <SpeechKit/SpeechKit.h>
#import "YPAAppDelegate.h"
#import <CoreLocation/CoreLocation.h>
#import  <AVFoundation/AVFoundation.h>
#import "YPATableCustomVC.h"
#import <QuartzCore/QuartzCore.h>


@interface YPAMainVC () <SpeechKitDelegate,SKRecognizerDelegate,CLLocationManagerDelegate>

@property (nonatomic) SKRecognizer *SpeechRecognizer;
@property (nonatomic) UIActivityIndicatorView *activityIndicator;

@end

const unsigned char SpeechKitApplicationKey[] = {0x99, 0x0a, 0x08, 0xc4, 0xbb, 0xed, 0x3b, 0xa9, 0x13, 0xae, 0x9d, 0xa8, 0x48, 0x19, 0x00, 0xe8, 0x27, 0x6c, 0x3e, 0x0d, 0x4a, 0x64, 0x1e, 0x15, 0xc3, 0xfe, 0xc8, 0x87, 0x91, 0xdb, 0x0d, 0x2b, 0xe6, 0x15, 0xef, 0xa1, 0x02, 0x2b, 0x4a, 0x15, 0xd9, 0xe8, 0xbd, 0x21, 0x01, 0xbe, 0x0a, 0x28, 0x2a, 0x48, 0x36, 0x74, 0xad, 0x54, 0x89, 0x70, 0x52, 0x51, 0xf8, 0xe4, 0x2d, 0x05, 0x0f, 0x13};

@implementation YPAMainVC
{
    UITextField *textConvert;
    UIButton *micButton;
    UILabel *recordText;
    CLLocationManager *lManager;
    CLLocation *currentLocation;
    YPATableCustomVC *customTable;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.navigationItem.title = @"Nearby Restaurants";
        textConvert = [[UITextField alloc] initWithFrame:CGRectMake(20, 80, 240, 40)];
        textConvert.borderStyle = UIBarButtonItemStyleDone;
        textConvert.layer.borderColor = [UIColor redColor].CGColor;
        textConvert.layer.cornerRadius = 3;
        textConvert.backgroundColor = [UIColor lightGrayColor];
        textConvert.alpha = 0.5;
        [self.view addSubview:textConvert];
        
        micButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 83, 30, 30)];
        micButton.layer.cornerRadius = 15;
        micButton.backgroundColor = [UIColor lightGrayColor];
        [micButton setBackgroundImage:[UIImage imageNamed:@"mic"] forState:UIControlStateNormal];
//        [micButton setImage:[UIImage imageNamed:@"mic"] forState:UIControlStateNormal];
        [micButton addTarget:self action:@selector(startRecording:) forControlEvents:UIControlEventTouchUpInside];
//        [micButton sizeToFit];
        [self.view addSubview:micButton];
        
        recordText = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH-20, 30)];
        recordText.text = @"Tap mic to start recording";
        [recordText setFont: [UIFont fontWithName:@"Arial" size:12]];
        recordText.textColor = [UIColor darkGrayColor];
        recordText.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:recordText];
        
        lManager = [[CLLocationManager alloc] init];
        lManager.delegate = self;
        [lManager startUpdatingLocation];
       
    }
    return self;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    currentLocation= [locations firstObject];
    NSLog(@"current location is %@",currentLocation);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//   self.activityIndicator.hidden = YES;
    YPAAppDelegate *appDel  = [UIApplication sharedApplication].delegate;
    [appDel setupSpeechKitConnection];
    textConvert.returnKeyType = UIReturnKeySearch;
    
    customTable = [[YPATableCustomVC alloc] init];
    customTable.view.frame = CGRectMake(0, 160, SCREEN_WIDTH, SCREEN_HEIGHT-160);
    [self.view addSubview:customTable.view];
}

-(void) startRecording : (UIButton *) sender
{
    NSLog(@" Recording started ");
    sender.selected = !sender.selected;
    if ([sender isSelected]) {
        self.SpeechRecognizer = [[SKRecognizer alloc] initWithType:SKSearchRecognizerType detection:SKShortEndOfSpeechDetection language:@"en_US" delegate:self];
    }else if (self.SpeechRecognizer)
    {
        [self.SpeechRecognizer stopRecording];
        [self.SpeechRecognizer cancel];
    }
    
}

-(void)recognizerDidBeginRecording:(SKRecognizer *)recognizer
{
    recordText.text = @"Listening ..";
}

-(void)recognizerDidFinishRecording:(SKRecognizer *)recognizer
{
    recordText.text = @"Done Listening ..";
}
-(void)recognizer:(SKRecognizer *)recognizer didFinishWithResults:(SKRecognition *)results
{
    long numberOfResults = [results.results count];
    if (numberOfResults > 0) {
        textConvert.text = [results firstResult];
    }
    micButton.selected = !micButton.selected;
    if (self.SpeechRecognizer) {
        [self.SpeechRecognizer cancel];
    }
    recordText.text = @"Tap mic to start recording";
}

-(void)recognizer:(SKRecognizer *)recognizer didFinishWithError:(NSError *)error suggestion:(NSString *)suggestion
{
    micButton.selected = NO;
//    self.activityIndicator.hidden = YES;
    recordText.text = @"Connection Error";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



@end

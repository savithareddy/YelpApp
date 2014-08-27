//
//  YPAMainVC.m
//  YelpApp
//
//  Created by Savitha Reddy on 8/26/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "YPAMainVC.h"

@interface YPAMainVC ()

@end

@implementation YPAMainVC
{
    UITextField *textConvert;
    UIButton *micButton;
    UILabel *recordText;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.navigationItem.title = @"Nearby Restaurants";
        textConvert = [[UITextField alloc] initWithFrame:CGRectMake(20, 80, 240, 40)];
        textConvert.borderStyle = UIBarButtonItemStyleBordered;
        textConvert.layer.cornerRadius = 5;
        textConvert.backgroundColor = [UIColor clearColor];
        [self.view addSubview:textConvert];
        
        micButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 83, 30, 30)];
        micButton.layer.cornerRadius = 15;
        micButton.backgroundColor = [UIColor lightGrayColor];
        [micButton setBackgroundImage:[UIImage imageNamed:@"mic"] forState:UIControlStateNormal];
//        [micButton setImage:[UIImage imageNamed:@"mic"] forState:UIControlStateNormal];
        [micButton addTarget:self action:@selector(startRecording) forControlEvents:UIControlEventTouchUpInside];
//        [micButton sizeToFit];
        [self.view addSubview:micButton];
        
        recordText = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH-20, 30)];
        recordText.text = @"Tap mic to start recording";
        [recordText setFont: [UIFont fontWithName:@"Arial" size:12]];
        recordText.textColor = [UIColor darkGrayColor];
        recordText.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:recordText];
       
    }
    return self;
}


-(void) startRecording
{
    NSLog(@" Recording started ");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



@end

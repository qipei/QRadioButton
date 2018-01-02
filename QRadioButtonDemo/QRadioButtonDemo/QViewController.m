//
//  QViewController.m
//  QRadioButtonDemo
//
//  Created by ivan on 13-7-18.
//  Copyright (c) 2013年 ivan. All rights reserved.
//

#import "QViewController.h"

@interface QViewController ()

@end

@implementation QViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor whiteColor];
	// Do any additional setup after loading the view, typically from a nib.
    
    QRadioButton *_radio1 = [[QRadioButton alloc] initWithDelegate:self groupId:@"groupId1"];
    _radio1.frame = CGRectMake(20, 20, 80, 40);
    [_radio1 setTitle:@"苹果" forState:UIControlStateNormal];
    [_radio1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_radio1.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [self.view addSubview:_radio1];
    [_radio1 setChecked:YES];
    
    QRadioButton *_radio2 = [[QRadioButton alloc] initWithDelegate:self groupId:@"groupId1"];
    _radio2.frame = CGRectMake(20, 70, 80, 40);
    [_radio2 setTitle:@"梨子" forState:UIControlStateNormal];
    [_radio2 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_radio2.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [self.view addSubview:_radio2];
    
    QRadioButton *_radio3 = [[QRadioButton alloc] initWithDelegate:self groupId:@"groupId2"];
    _radio3.frame = CGRectMake(20, 160, 80, 40);
    [_radio3 setTitle:@"Apple" forState:UIControlStateNormal];
    [_radio3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_radio3 setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [_radio3 setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [_radio3.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [_radio3 setImage:[UIImage imageNamed:@"radio_unselected.png"] forState:UIControlStateNormal];
    [_radio3 setImage:[UIImage imageNamed:@"radio_selected.png"] forState:UIControlStateSelected];
    [self.view addSubview:_radio3];
    [_radio3 setChecked:YES];
    
    QRadioButton *_radio4 = [[QRadioButton alloc] initWithDelegate:self groupId:@"groupId2"];
    _radio4.frame = CGRectMake(20, 210, 80, 40);
    [_radio4 setTitle:@"Banana" forState:UIControlStateNormal];
    [_radio4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_radio4 setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [_radio4 setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [_radio4.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [_radio4 setImage:[UIImage imageNamed:@"radio_unselected.png"] forState:UIControlStateNormal];
    [_radio4 setImage:[UIImage imageNamed:@"radio_selected.png"] forState:UIControlStateSelected];
    [self.view addSubview:_radio4];
    [_radio4 setChecked:NO];
}

#pragma mark - QRadioButtonDelegate

- (void)didSelectedRadioButton:(QRadioButton *)radio groupId:(NSString *)groupId {
    NSLog(@"did selected radio:%@ groupId:%@", radio.titleLabel.text, groupId);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

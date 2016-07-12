//
//  ViewController.m
//  LHLabel
//
//  Created by bangong on 16/6/30.
//  Copyright © 2016年 auto. All rights reserved.
//

#import "ViewController.h"
#import "LHLabel.h"

@interface ViewController ()<LHLabelDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    LHLabel *label = [[LHLabel alloc] initWithFrame:CGRectMake(20, 20, 200, 160)];
    [self.view addSubview:label];
    label.preferredMaxLayoutWidth = 200;
    label.numberOfLines = 0;
    label.highlightColor = [UIColor redColor];
   // label.lineSpacing = 5;
    label.delegate = self;

//    label.shadowBlur = 0.5;
//    label.shadowOffset = CGSizeMake(4, 5);
//    label.shadowColor = [UIColor redColor];
    label.textInsets = UIEdgeInsetsMake(30, 10, 0,0);
   // label.textInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    label.lineBreakMode = kCTLineBreakByTruncatingTail;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label)]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label)]];
  NSString *text =  @"窗前明月光https://www.baidu.com疑是地上地上地上地上地上霜举头望明月低头思故乡霜举头望明月低头思故乡7ikhttps://头望明月低头思故乡";
    label.text = text;
    [label addUrl:[NSURL URLWithString:@"https://www.baidu.com"] range:NSMakeRange(20, 25)];
    [label addImage:[UIImage imageNamed:@"keyboard1.gif"] data:@{} size:CGSizeMake(50, 50) range:NSMakeRange(1, 2)];
    [label addImage:[UIImage imageNamed:@"keyboard1.gif"] data:@{} size:CGSizeMake(50, 50) range:NSMakeRange(3, 2)];

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    btn.titleLabel.font = label.font;
    btn.backgroundColor  =[UIColor blueColor];
    [btn setTitle:@"afddsagad" forState:UIControlStateNormal];
    [btn sizeToFit];
    [label addView:btn size:btn.frame.size range:NSMakeRange(5, 5)];

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)storage:(LHLabelTextStorage *)storage{
    NSLog(@"%@",storage.returnData);

//    if([storage.returnData isKindOfClass:[NSURL class]]){
//        [[UIApplication sharedApplication] openURL:storage.returnData];
//    }

}

@end

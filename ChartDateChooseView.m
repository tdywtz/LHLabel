//
//  ChartDateChooseView.m
//  chezhiwang
//
//  Created by bangong on 16/11/2.
//  Copyright © 2016年 车质网. All rights reserved.
//

#import "ChartDateChooseView.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@implementation ChartDateChooseView
{
    UIDatePicker *beginDatePicker;
    UIDatePicker *endDatePicker;

    UILabel *beginDateLabel;
    UILabel *endDateLabel;
}


- (instancetype)initWithFrame:(CGRect)frame chooseDeate:(void(^)(NSString *, NSString *))chooseDeate{
    self = [super initWithFrame:frame];
    if (self) {
        self.chooseDeate = chooseDeate;
        self.backgroundColor = [UIColor whiteColor];
        self.hidden = YES;
        self.alpha = 0;
        [self createDatePicker];
    }
    return self;
}

- (void)show{
    self.hidden = NO;
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
    }];
}

- (void)dismiss{
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

-(void)createDatePicker{

    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];


    UIButton *finishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [finishButton setTitle:@"确定" forState:UIControlStateNormal];
    [finishButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [finishButton addTarget:self action:@selector(finishButtonClick) forControlEvents:UIControlEventTouchUpInside];

    UILabel *beginlabel = [[UILabel alloc] init];
    beginlabel.text = @"开始日期";


    beginDateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    beginDateLabel.font = [UIFont systemFontOfSize:15];

    UILabel *endLabel = [[UILabel alloc] init];
    endLabel.text  = @"结束日期";

    endDateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    endDateLabel.font = [UIFont systemFontOfSize:15];

    beginDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
   // beginDatePicker.transform = CGAffineTransformMakeScale(0.5, 1);
    //最小时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    beginDatePicker.minimumDate = [formatter dateFromString:@"1919-10-10"];
    //最大时间
    beginDatePicker.maximumDate = [NSDate date];
    //设置时间模式为中文显示
    beginDatePicker.datePickerMode = UIDatePickerModeDate;
    NSLocale * locale = [[NSLocale alloc] initWithLocaleIdentifier:@"Chinese"];
    [beginDatePicker setLocale:locale];
    //添加事件
    [beginDatePicker addTarget:self action:@selector(beginDateClick) forControlEvents:UIControlEventValueChanged];
    CGRect rect = beginDatePicker.frame;
    rect.origin.x = 0;
    beginDatePicker.frame = rect;

    endDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
   // endDatePicker.transform = CGAffineTransformMakeScale(0.5, 1);
    //最小时间
    [formatter setDateFormat:@"yyyy-MM-dd"];
    endDatePicker.minimumDate = [formatter dateFromString:@"1980-10-10"];
    //最大时间
    endDatePicker.maximumDate = [NSDate date];
    //设置时间模式为中文显示
    endDatePicker.datePickerMode = UIDatePickerModeDate;
    [endDatePicker setLocale:locale];
    //添加事件
    [endDatePicker addTarget:self action:@selector(endDateClick) forControlEvents:UIControlEventValueChanged];

    UIView *lineView1 = [[UIView alloc] init];
    lineView1.backgroundColor = [UIColor blueColor];

    UIView *lineView2 = [[UIView alloc] init];
    lineView2.backgroundColor = [UIColor blueColor];

    UIView *lineView3 = [[UIView alloc] init];
    lineView3.backgroundColor = [UIColor blueColor];

    UIView *lineView4 = [[UIView alloc] init];
    lineView4.backgroundColor = [UIColor blueColor];

    UIView *lineView5 = [[UIView alloc] init];
    lineView5.backgroundColor = [UIColor blueColor];

    [self addSubview:cancelButton];
    [self addSubview:finishButton];
    [self addSubview:beginDateLabel];
    [self addSubview:endDateLabel];
    [self addSubview:beginlabel];
    [self addSubview:endLabel];
    [self addSubview:beginDatePicker];
    [self addSubview:endDatePicker];
    [self addSubview:lineView1];
    [self addSubview:lineView2];
    [self addSubview:lineView3];
    [self addSubview:lineView4];
    [self addSubview:lineView5];

    [cancelButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(10);
        make.top.equalTo(15);
    }];

    [finishButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-10);
        make.top.equalTo(15);
    }];

    [lineView1 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(10);
        make.right.equalTo(0);
        make.height.equalTo(1);
        make.top.equalTo(cancelButton.bottom).offset(15);
    }];

    [beginlabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(10);
        make.top.equalTo(lineView1.bottom);
        make.height.equalTo(30);
    }];

    [beginDateLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.height.equalTo(30);
        make.top.equalTo(beginlabel);
    }];


    [lineView2 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView1);
        make.right.equalTo(lineView1);
        make.height.equalTo(lineView1);
        make.top.equalTo(beginDateLabel);
    }];

    [beginDateLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.height.equalTo(180);
        make.top.equalTo(lineView2.bottom).offset(30);
    }];

    [lineView3 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView1);
        make.right.equalTo(lineView1);
        make.height.equalTo(5);
        make.centerY.equalTo(15);
    }];

    [lineView4 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView1);
        make.right.equalTo(lineView1);
        make.height.equalTo(lineView1);
        make.top.equalTo(lineView3.bottom).offset(20);
    }];

    [endLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView4);
        make.height.equalTo(30);
        make.left.equalTo(10);
    }];

    [endDateLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(endLabel);
        make.centerX.equalTo(0);
        make.height.equalTo(30);
    }];

    [lineView5 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView1);
        make.right.equalTo(lineView1);
        make.height.equalTo(lineView1);
        make.top.equalTo(endLabel);
    }];

    [endDatePicker makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.bottom.equalTo(-30);
        make.height.equalTo(180);
    }];
}

- (void)cancelClick{
    [self dismiss];
}

- (void)finishButtonClick{
    if ([beginDateLabel.text floatValue] < 100) {
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"请选择开始时间" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [self.parentViewController presentViewController:ac animated:YES completion:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [ac dismissViewControllerAnimated:YES completion:nil];
        });
        return;
    }else if ([endDateLabel.text floatValue] < 100){
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"请选择结束时间" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [self.parentViewController presentViewController:ac animated:YES completion:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [ac dismissViewControllerAnimated:YES completion:nil];
        });
        return;
    }
    if ([endDateLabel.text integerValue] > 100 && [beginDateLabel.text integerValue] > 100) {
        if (self.chooseDeate) {
            self.chooseDeate(beginDateLabel.text,endDateLabel.text);
        }
    }

    [self dismiss];
}

-(void)beginDateClick{
    //转换
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //
    beginDateLabel.text = [formatter stringFromDate:beginDatePicker.date];
    endDatePicker.minimumDate = beginDatePicker.date;
}

-(void)endDateClick
{

    //转换
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //
    endDateLabel.text  = [formatter stringFromDate:endDatePicker.date];
    beginDatePicker.maximumDate = endDatePicker.date;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

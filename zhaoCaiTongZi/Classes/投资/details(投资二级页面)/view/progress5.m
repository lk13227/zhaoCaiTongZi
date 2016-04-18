//
//  progress.m
//  去去去去去去
//
//  Created by Dragonup on 16/1/16.
//  Copyright © 2016年 Dragonup. All rights reserved.
//

#import "progress5.h"

@implementation progress5


- (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self drawUI];
    }
    return self;
}

- (void)drawUI
{
    _XZBProgressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 20 - 52 - 30, 20)];
    _XZBProgressView.layer.masksToBounds = YES;
    _XZBProgressView.layer.cornerRadius = 5;
    _XZBProgressView.backgroundColor = RGB_COLOR(202, 202, 202, 1);
    [self addSubview:_XZBProgressView];
    UIProgressView *processView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView.frame = CGRectMake(0, 0,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView];
    processView.progress = 0.1;
    processView.trackTintColor = [UIColor orangeColor];
    processView.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView setProgress:1 animated:YES];
    
    UIProgressView *processView1 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView1.frame = CGRectMake(0, 1,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView1];
    processView1.progress = 0.1;
    processView1.trackTintColor = [UIColor redColor];
    processView1.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView1 setProgress:1 animated:YES];
    
    UIProgressView *processView2 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView2.frame = CGRectMake(0, 2,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView2];
    processView2.progress = 0.1;
    processView2.trackTintColor = [UIColor redColor];
    processView2.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView2 setProgress:1 animated:YES];
    
    UIProgressView *processView3 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView3.frame = CGRectMake(0, 3,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView3];
    processView3.progress = 0.1;
    processView3.trackTintColor = [UIColor redColor];
    processView3.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView3 setProgress:1 animated:YES];
    
    UIProgressView *processView4 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView4.frame = CGRectMake(0, 4,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView4];
    processView4.progress = 0.1;
    processView4.trackTintColor = [UIColor redColor];
    processView4.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView4 setProgress:1 animated:YES];
    
    UIProgressView *processView5 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView5.frame = CGRectMake(0, 5,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView5];
    processView5.progress = 0.1;
    processView5.trackTintColor = [UIColor redColor];
    processView5.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView5 setProgress:1 animated:YES];
    
    UIProgressView *processView6 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView6.frame = CGRectMake(0, 6,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView6];
    processView6.progress = 0.1;
    processView6.trackTintColor = [UIColor redColor];
    processView6.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView6 setProgress:1 animated:YES];
    
    UIProgressView *processView7 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView7.frame = CGRectMake(0, 7,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView7];
    processView7.progress = 0.1;
    processView7.trackTintColor = [UIColor redColor];
    processView7.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView7 setProgress:1 animated:YES];
    
    UIProgressView *processView8 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView8.frame = CGRectMake(0, 8,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView8];
    processView8.progress = 0.1;
    processView8.trackTintColor = [UIColor redColor];
    processView8.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView8 setProgress:1 animated:YES];
    
    UIProgressView *processView9 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView9.frame = CGRectMake(0, 9,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView9];
    processView9.progress = 0.1;
    processView9.trackTintColor = [UIColor redColor];
    processView9.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView9 setProgress:1 animated:YES];
    
    UIProgressView *processView10 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView10.frame = CGRectMake(0, 10,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView10];
    processView10.progress = 0.1;
    processView10.trackTintColor = [UIColor redColor];
    processView10.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView10 setProgress:1 animated:YES];
    
    UIProgressView *processView11 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView11.frame = CGRectMake(0, 11,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView11];
    processView11.progress = 0.1;
    processView11.trackTintColor = [UIColor redColor];
    processView11.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView11 setProgress:1 animated:YES];
    
    UIProgressView *processView12 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView12.frame = CGRectMake(0, 12,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView12];
    processView12.progress = 0.1;
    processView12.trackTintColor = [UIColor redColor];
    processView12.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView12 setProgress:1 animated:YES];
    
    UIProgressView *processView13 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView13.frame = CGRectMake(0, 13,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView13];
    processView13.progress = 0.1;
    processView13.trackTintColor = [UIColor redColor];
    processView13.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView13 setProgress:1 animated:YES];
    
    UIProgressView *processView14 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView14.frame = CGRectMake(0, 14,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView14];
    processView14.progress = 0.1;
    processView14.trackTintColor = [UIColor redColor];
    processView14.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView14 setProgress:1 animated:YES];
    
    UIProgressView *processView15 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView15.frame = CGRectMake(0, 15,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView15];
    processView15.progress = 0.1;
    processView15.trackTintColor = [UIColor redColor];
    processView15.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView15 setProgress:1 animated:YES];
    
    UIProgressView *processView16 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView16.frame = CGRectMake(0, 16,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView16];
    processView16.progress = 0.1;
    processView16.trackTintColor = [UIColor redColor];
    processView16.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView16 setProgress:1 animated:YES];
    
    UIProgressView *processView17 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView17.frame = CGRectMake(0, 17,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView17];
    processView17.progress = 0.1;
    processView17.trackTintColor = [UIColor redColor];
    processView17.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView17 setProgress:1 animated:YES];
    
    UIProgressView *processView18 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView18.frame = CGRectMake(0, 18,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView18];
    processView18.progress = 0.1;
    processView18.trackTintColor = [UIColor redColor];
    processView18.progressTintColor = RGB_COLOR(251, 103, 54, 1);;
    [processView18 setProgress:1 animated:YES];
    
    UIProgressView *processView19 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView19.frame = CGRectMake(0, 19,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView19];
    processView19.progress = 0.1;
    processView19.trackTintColor = [UIColor redColor];
    processView19.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView19 setProgress:1 animated:YES];
    
    UIProgressView *processView20 = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    processView20.frame = CGRectMake(0, 20,SCREEN_WIDTH / 1.704, 30);
    [_XZBProgressView addSubview:processView20];
    processView20.progress = 0.1;
    processView20.trackTintColor = [UIColor redColor];
    processView20.progressTintColor = RGB_COLOR(251, 103, 54, 1);
    [processView20 setProgress:1 animated:YES];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

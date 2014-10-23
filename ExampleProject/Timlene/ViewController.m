//
//  ViewController.m
//  Timlene
//
//  Created by Roma on 9/30/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

#import "ViewController.h"
#import "TimeLineViewControl.h"

@interface ViewController ()
{
    TimeLineViewControl *_timeline;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *times = @[@"sun",@"mon",@"tue",@"wed",@"thr",@"fri",@"sat"];
    NSArray *descriptions = @[@"state 1",@"state 2",@"state 3",@"state 4",@"very very long and very very detailed description 0f state 5",@"state 6",@"state 7"];
    TimeLineViewControl *timeline = [[TimeLineViewControl alloc] initWithTimeArray:times
                                                           andTimeDescriptionArray:descriptions
                                                                  andCurrentStatus:4
                                                                          andFrame:CGRectMake(50, 120, self.view.frame.size.width - 30, 200)];
    timeline.center = self.view.center;
    [self.view addSubview:timeline];
    
    _timeline = timeline;
    
    timeline.timeLineBlock = ^ (NSInteger index) {
        
        NSLog(@"you click %@--%@",times[index], descriptions[index]);
    };
    
    // add button
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 400, 50, 50)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)click{
    _timeline.status = 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

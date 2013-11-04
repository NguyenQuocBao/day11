//
//  ViewController.m
//  day11
//
//  Created by Nguyen Bao on 11/2/13.
//  Copyright (c) 2013 Nguyen Quoc Bao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ball;


@end

@implementation ViewController
CGPoint pos;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ballStart:(id)sender {
    pos = CGPointMake(14.0,7.0);
	
	[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];

}


-(void) onTimer {
	//self.ball
    self.ball.center = CGPointMake(self.ball.center.x+pos.x,self.ball.center.y+pos.y);
	
	if(self.ball.center.x > 320 || self.ball.center.x < 0)
		pos.x = -pos.x;
	if(self.ball.center.y > 460 || self.ball.center.y < 0)
		pos.y = -pos.y;
}


@end

//
//  MarioController.m
//  day11
//
//  Created by Nguyen Bao on 11/2/13.
//  Copyright (c) 2013 Nguyen Quoc Bao. All rights reserved.
//

#import "MarioController.h"

@interface MarioController (){
    float _alpha;
    NSTimer *moveObjectTimer;
    float firstMarioY;
    float firstMarioX;
    float firstBallY;
    float firstBallX;
    int point;
}

@property (weak, nonatomic) IBOutlet UIImageView *mario;
@property (weak, nonatomic) IBOutlet UIImageView *ball;
@property (weak, nonatomic) IBOutlet UILabel *lblPoint;

@end

@implementation MarioController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    firstMarioY=_mario.center.y;
    firstBallY=_ball.center.y;
    firstMarioX=_mario.center.x;
    firstBallX=_ball.center.x;
    point=0;
    _lblPoint.text=[NSString stringWithFormat:@"%d",point];
    _alpha=0;
    
}



-(void) moveObject{

    
    self.ball.center =CGPointMake(self.ball.center.x-5, self.ball.center.y);    
    
    self.mario.center =CGPointMake(self.mario.center.x+5, self.mario.center.y);
    

    
    if (self.mario.center.x==self.ball.center.x && self.mario.center.y==firstMarioY){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"You lose"
                                                          message:@"Đụng nhau mà không nhẩy ah"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
        
        [moveObjectTimer invalidate];
        
    }
    
    
    if (self.mario.center.x>self.ball.center.x && self.mario.center.y!=firstMarioY && (self.mario.center.x)>(self.ball.center.x+self.ball.frame.size.width)){
        self.mario.center =CGPointMake(self.mario.center.x, self.mario.center.y+50);
        point=10;
        _lblPoint.text=[NSString stringWithFormat:@"%d",point];
    }
    
    
    if (firstBallX==self.mario.center.x){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"You win"
                                                          message:@"Done"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
        [moveObjectTimer invalidate];
        
    }
    
    
}


- (IBAction)gameStart:(id)sender {
    
    self.mario.center =CGPointMake(firstMarioX, firstMarioY);
    self.ball.center =CGPointMake(firstBallX, firstBallY);
    
     moveObjectTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveObject) userInfo:nil repeats:YES];
}


- (IBAction)marioJum:(id)sender {
     self.mario.center =CGPointMake(self.mario.center.x, self.mario.center.y-50);
}

@end

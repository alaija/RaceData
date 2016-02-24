//
//  RDSpeedometerView.m
//  RaceData
//
//  Created by Alan Kochev on 09/01/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import "RDSpeedometerView.h"
#import "PureLayout.h"
#import "RDSpeedLabel.h"

@interface RDSpeedometerView ()

@property (nonatomic, strong) UIImageView *panelView;
@property (nonatomic, strong) UIImageView *needleView;

@property (nonatomic, strong) RDSpeedLabel *speed20;
@property (nonatomic, strong) RDSpeedLabel *speed40;
@property (nonatomic, strong) RDSpeedLabel *speed60;
@property (nonatomic, strong) RDSpeedLabel *speed80;
@property (nonatomic, strong) RDSpeedLabel *speed100;
@property (nonatomic, strong) RDSpeedLabel *speed120;
@property (nonatomic, strong) RDSpeedLabel *speed140;
@property (nonatomic, strong) RDSpeedLabel *speed160;
@property (nonatomic, strong) RDSpeedLabel *speed180;
@property (nonatomic, strong) RDSpeedLabel *speed200;
@property (nonatomic, strong) RDSpeedLabel *speed220;
@property (nonatomic, strong) RDSpeedLabel *speed240;
@property (nonatomic, strong) RDSpeedLabel *speed260;

@property (nonatomic) CGFloat angle;
@end

@implementation RDSpeedometerView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setSpeed:(CGFloat)speed
{
    _speed = speed+100;
    
    [self calculateDeviationAngle];
}

- (void)setup
{
    _panelView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"speedometerView"]];
    _needleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    _needleView.layer.anchorPoint = CGPointMake(.5, .835);
    _speed20 = [RDSpeedLabel new];
    [_speed20 setText:@"20"];
    _speed40 = [RDSpeedLabel new];
    [_speed40 setText:@"40"];
    _speed60 = [RDSpeedLabel new];
    [_speed60 setText:@"60"];
    _speed80 = [RDSpeedLabel new];
    [_speed80 setText:@"80"];
    _speed100 = [RDSpeedLabel new];
    [_speed100 setText:@"100"];
    _speed120 = [RDSpeedLabel new];
    [_speed120 setText:@"120"];
    _speed140 = [RDSpeedLabel new];
    [_speed140 setText:@"140"];
    _speed160 = [RDSpeedLabel new];
    [_speed160 setText:@"160"];
    _speed180 = [RDSpeedLabel new];
    [_speed180 setText:@"180"];
    _speed200 = [RDSpeedLabel new];
    [_speed200 setText:@"200"];
    _speed220 = [RDSpeedLabel new];
    [_speed220 setText:@"220"];
    _speed240 = [RDSpeedLabel new];
    [_speed240 setText:@"240"];
    _speed260 = [RDSpeedLabel new];
    [_speed260 setText:@"260"];
    
    [self addSubview:_panelView];
    [self addSubview:_needleView];
    [self addSubview:_speed20];
    [self addSubview:_speed40];
    [self addSubview:_speed60];
    [self addSubview:_speed80];
    [self addSubview:_speed100];
    [self addSubview:_speed120];
    [self addSubview:_speed140];
    [self addSubview:_speed160];
    [self addSubview:_speed180];
    [self addSubview:_speed200];
    [self addSubview:_speed220];
    [self addSubview:_speed240];
    [self addSubview:_speed260];
    
    [NSLayoutConstraint autoSetIdentifier:@"Speedometer" forConstraints:^{
        [_panelView autoPinEdgesToSuperviewEdges];
        [_needleView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:_panelView withMultiplier:8./53];
        [_needleView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:_panelView withMultiplier:176./377];
        [_needleView autoAlignAxis:ALAxisVertical toSameAxisOfView:_panelView];
        [_needleView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_panelView withMultiplier:1.09];
        [_speed20 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.5];
        [_speed20 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.65];
        [_speed40 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.34];
        [_speed40 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.41];
        [_speed60 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.3];
        [_speed60 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.1];
        [_speed80 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.35];
        [_speed80 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.8];
        [_speed100 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.48];
        [_speed100 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.55];
        [_speed120 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.71];
        [_speed120 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.38];
        [_speed140 autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_speed140 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.32];
        [_speed160 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.28];
        [_speed160 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.38];
        [_speed180 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.52];
        [_speed180 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.55];
        [_speed200 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.65];
        [_speed200 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.8];
        [_speed220 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.7];
        [_speed220 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.1];
        [_speed240 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.66];
        [_speed240 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.41];
        [_speed260 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.5];
        [_speed260 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.65];
    }];
}

-(void) calculateDeviationAngle
{
    self.angle = ((self.speed * 272.)/240.)-136.;  // 237.4 - Total angle between 0 - 100 //

    
//    if(self.angle<=-136.)
//    {
//        self.angle = -136.;
//    }
//    if(self.angle>=136.)
//    {
//       self.angle = 136.;
//    }
    
    
    // If Calculated angle is greater than 180 deg, to avoid the needle to rotate in reverse direction first rotate the needle 1/3 of the calculated angle and then 2/3. //
//    if(abs(self.angle-self.prevAngleFactor) > 180)
//    {
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:0.5f];
//        [self rotateIt:self.angle/3];
//        [UIView commitAnimations];
//        
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:0.5f];
//        [self rotateIt:(self.angle*2)/3];
//        [UIView commitAnimations];
//        
//    }
//    
//    self.prevAngleFactor = self.angle;
    
    
    // Rotate Needle //
    [self rotateNeedle];
    
    
}


#pragma mark -
#pragma mark rotateNeedle Method
-(void) rotateNeedle
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.f];
    [self.needleView setTransform: CGAffineTransformMakeRotation((M_PI / 180) * self.angle)];
    [UIView commitAnimations];
    
}


@end

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
#import "UILabel+RDLabel.h"

@interface RDSpeedometerView ()

@property(nonatomic) CGFloat prevAngleFactor;

@property (nonatomic, strong) UIImageView *panelView;
@property (nonatomic, strong) UIImageView *needleView;

@property (nonatomic, strong) UILabel *mesureLabel;

@property (nonatomic, strong) RDSpeedLabel *speedLabel;
@property (nonatomic, strong) RDSpeedLabel *speed0;
@property (nonatomic, strong) RDSpeedLabel *speed20;
@property (nonatomic, strong) RDSpeedLabel *speed40;
@property (nonatomic, strong) RDSpeedLabel *speed60;
@property (nonatomic, strong) RDSpeedLabel *speed80;
@property (nonatomic, strong) RDSpeedLabel *speed100;
@property (nonatomic, strong) RDSpeedLabel *speed120;
@property (nonatomic, strong) RDSpeedLabel *speed140;
@property (nonatomic, strong) RDSpeedLabel *speed160;
@property (nonatomic, strong) RDSpeedLabel *speed180;
@property (nonatomic, strong) RDSpeedLabel *speed220;
@property (nonatomic, strong) RDSpeedLabel *speed260;
@property (nonatomic, strong) RDSpeedLabel *speed300;

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
    _speed = speed;
    [_speedLabel setText:[NSString stringWithFormat:@"%.f", speed]];
    [self calculateDeviationAngle];
}

- (void)setup
{
    _panelView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"speedometerView"]];
    _needleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    _needleView.layer.anchorPoint = CGPointMake(.5, .835);
    _mesureLabel = [UILabel new];
    [UILabel setupLabelAsDefault:_mesureLabel];
    _mesureLabel.text = @"КМ/Ч";
    _speedLabel = [[RDSpeedLabel alloc] initWithTextSize:120.];
    [_speedLabel setText:@"0"];
    _speed0 = [RDSpeedLabel new];
    [_speed0 setText:@"0"];
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
    _speed220 = [RDSpeedLabel new];
    [_speed220 setText:@"220"];
    _speed260 = [RDSpeedLabel new];
    [_speed260 setText:@"260"];
    _speed300 = [RDSpeedLabel new];
    [_speed300 setText:@"300"];
    
    [self addSubview:_panelView];
    [self addSubview:_needleView];
    [self addSubview:_mesureLabel];
    [self addSubview:_speedLabel];
    [self addSubview:_speed0];
    [self addSubview:_speed20];
    [self addSubview:_speed40];
    [self addSubview:_speed60];
    [self addSubview:_speed80];
    [self addSubview:_speed100];
    [self addSubview:_speed120];
    [self addSubview:_speed140];
    [self addSubview:_speed160];
    [self addSubview:_speed180];
    [self addSubview:_speed220];
    [self addSubview:_speed260];
    [self addSubview:_speed300];
    
    [NSLayoutConstraint autoSetIdentifier:@"Speedometer" forConstraints:^{
        [_panelView autoPinEdgesToSuperviewEdges];
        [_needleView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:_panelView withMultiplier:8./53];
        [_needleView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:_panelView withMultiplier:176./377];
        [_needleView autoAlignAxis:ALAxisVertical toSameAxisOfView:_panelView];
        [_needleView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_panelView withMultiplier:1.09];
        [_mesureLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_mesureLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_speedLabel withOffset:20.];
        [_speedLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_speedLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_panelView withMultiplier:1.85];
        [_speed0 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.48];
        [_speed0 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.65];
        [_speed20 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.34];
        [_speed20 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.41];
        [_speed40 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.28];
        [_speed40 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.1];
        [_speed60 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.34];
        [_speed60 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.8];
        [_speed80 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.49];
        [_speed80 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.55];
        [_speed100 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.71];
        [_speed100 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.38];
        [_speed120 autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_speed120 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.32];
        [_speed140 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.28];
        [_speed140 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.38];
        [_speed160 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.51];
        [_speed160 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.55];
        [_speed180 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.65];
        [_speed180 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.8];
        [_speed220 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.7];
        [_speed220 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.1];
        [_speed260 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.66];
        [_speed260 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.41];
        [_speed300 autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.5];
        [_speed300 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.65];
    }];
}

-(void) calculateDeviationAngle
{
    CGFloat speed = self.speed;
    
    if (speed > 180) {
        speed = 180 + (self.speed - 180.) / 2;
    }
    
    self.angle = ((speed * 272.)/240.)-136.;  // 237.4 - Total angle between 0 - 100 //

    
    if(self.angle<=-136.)
    {
        self.angle = -136.;
    }
    if(self.angle>=136.)
    {
       self.angle = 136.;
    }
    
    
    // If Calculated angle is greater than 180 deg, to avoid the needle to rotate in reverse direction first rotate the needle 1/3 of the calculated angle and then 2/3. //
    if(fabs(self.angle-self.prevAngleFactor) > 180)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5f];
        [self rotateIt:self.angle/3];
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5f];
        [self rotateIt:(self.angle*2)/3];
        [UIView commitAnimations];
        
    } else {
        [self rotateNeedle];
    }
    
    self.prevAngleFactor = self.angle;
}


#pragma mark -
#pragma mark rotateNeedle Method
-(void)rotateNeedle
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.f];
    [self rotateIt:self.angle];
    [UIView commitAnimations];
}

-(void)rotateIt:(CGFloat)angl
{
    [self.needleView setTransform: CGAffineTransformMakeRotation((M_PI / 180) * angl)];
}


@end

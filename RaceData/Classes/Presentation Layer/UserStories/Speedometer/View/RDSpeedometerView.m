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
#import "UIFont+RDFont.h"

@interface RDSpeedometerView ()

@property(nonatomic) CGFloat prevAngleFactor;

@property (nonatomic, strong) UIImageView *panelView;
@property (nonatomic, strong) UIImageView *needleView;

@property (nonatomic, strong) UILabel *mesureLabel;

@property (nonatomic, strong) NSArray <RDSpeedLabel *> *speedIndicators;

@property (nonatomic, strong) RDSpeedLabel *speedLabel;

@property (nonatomic) CGFloat angle;
@property (nonatomic) NSUInteger selectedIndex;

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
    _speedLabel = [[RDSpeedLabel alloc] initWithTextSize:[UIFont bigFontSize]];
    [_speedLabel setText:@"0"];
    
    self.speedIndicators = @[ [RDSpeedLabel new],
                              [RDSpeedLabel new],
                              [RDSpeedLabel new],
                              [RDSpeedLabel new],
                              [RDSpeedLabel new],
                              [RDSpeedLabel new],
                              [RDSpeedLabel new],
                              [RDSpeedLabel new],
                              [RDSpeedLabel new],
                              [RDSpeedLabel new],
                              [RDSpeedLabel new],
                              [RDSpeedLabel new],
                              [RDSpeedLabel new] ];
    
    [self.speedIndicators[0] setText:@"0"];
    [self.speedIndicators[1] setText:@"20"];
    [self.speedIndicators[2] setText:@"40"];
    [self.speedIndicators[3] setText:@"60"];
    [self.speedIndicators[4] setText:@"80"];
    [self.speedIndicators[5] setText:@"100"];
    [self.speedIndicators[6] setText:@"120"];
    [self.speedIndicators[7] setText:@"140"];
    [self.speedIndicators[8] setText:@"160"];
    [self.speedIndicators[9] setText:@"180"];
    [self.speedIndicators[10] setText:@"220"];
    [self.speedIndicators[11] setText:@"260"];
    [self.speedIndicators[12] setText:@"300"];
    
    for (RDSpeedLabel *label in self.speedIndicators) {
        [self addSubview:label];
    }
    
    [self addSubview:_mesureLabel];
    [self addSubview:_speedLabel];
    [self addSubview:_panelView];
    [self addSubview:_needleView];
    
    
    [NSLayoutConstraint autoSetIdentifier:@"Speedometer" forConstraints:^{
        [_panelView autoPinEdgesToSuperviewEdges];
        [_needleView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:_panelView withMultiplier:8./53];
        [_needleView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:_panelView withMultiplier:176./377];
        [_needleView autoAlignAxis:ALAxisVertical toSameAxisOfView:_panelView];
        [_needleView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_panelView withMultiplier:1.09];
        [_mesureLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_mesureLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_speedLabel withOffset:0.];
        [_speedLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_speedLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_panelView withMultiplier:1.85];
        [self.speedIndicators[0] autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.48];
        [self.speedIndicators[0] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.65];
        [self.speedIndicators[1] autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.34];
        [self.speedIndicators[1] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.41];
        [self.speedIndicators[2] autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.28];
        [self.speedIndicators[2] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.1];
        [self.speedIndicators[3] autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.34];
        [self.speedIndicators[3] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.8];
        [self.speedIndicators[4] autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.49];
        [self.speedIndicators[4] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.55];
        [self.speedIndicators[5] autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:0.71];
        [self.speedIndicators[5] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.38];
        [self.speedIndicators[6] autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.speedIndicators[6] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.32];
        [self.speedIndicators[7] autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.28];
        [self.speedIndicators[7] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.38];
        [self.speedIndicators[8] autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.51];
        [self.speedIndicators[8] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.55];
        [self.speedIndicators[9] autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.65];
        [self.speedIndicators[9] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:0.8];
        [self.speedIndicators[10] autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.7];
        [self.speedIndicators[10] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.1];
        [self.speedIndicators[11] autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.66];
        [self.speedIndicators[11] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.41];
        [self.speedIndicators[12] autoAlignAxis:ALAxisVertical toSameAxisOfView:self withMultiplier:1.5];
        [self.speedIndicators[12] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withMultiplier:1.65];
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
    [UIView animateWithDuration:1. animations:^{
        [self rotateIt:self.angle];
    } completion:^(BOOL finished) {
        [self highlightSpeedAtAngle:self.angle];
    }];
}

-(void)rotateIt:(CGFloat)angl
{
    [self.needleView setTransform: CGAffineTransformMakeRotation((M_PI / 180) * angl)];

}

- (void)highlightSpeedAtAngle:(CGFloat)angl
{
    self.speedIndicators[_selectedIndex].highlighted = NO;
    if (self.angle <= -125.) {
        _selectedIndex = 0.;
    } else if ( self.angle >= 125.) {
        _selectedIndex = 12.;
    } else {
        _selectedIndex = (NSUInteger)round((angl + 136.)/22.5 - 0.065);
    }
    
    self.speedIndicators[_selectedIndex].highlighted = YES;
}


@end

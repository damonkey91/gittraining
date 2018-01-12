//
//  ViewController.m
//  ColorMixer
//
//  Created by lösen är 0000 on 2018-01-12.
//  Copyright © 2018 lösen är 0000. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//Här läger vi privata properties
@property (weak, nonatomic) IBOutlet UISlider *redAmount;
@property (weak, nonatomic) IBOutlet UISlider *greenAmount;
@property (weak, nonatomic) IBOutlet UISlider *blueAmount;
@property (weak, nonatomic) IBOutlet UIView *colorDisplay;
@property (weak, nonatomic) IBOutlet UIView *thirddisplay;
@property (weak, nonatomic) IBOutlet UIView *secondDisplay;
@property (weak, nonatomic) IBOutlet UIView *firstDisplay;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self refresh];
}


- (IBAction)sliderChanged:(id)sender {
   // self.colorDisplay.backgroundColor = [self currentColor];
    self.firstDisplay.backgroundColor = [UIColor colorWithRed:self.redAmount.value-0.1 green:self.greenAmount.value blue:self.blueAmount.value alpha:1.0f];
    [self refresh];
}

-(void) refresh{
    self.colorDisplay.backgroundColor  = [self currentColor];
}

-(UIColor*) currentColor {
    return [UIColor colorWithRed:self.redAmount.value green:self.greenAmount.value blue:self.blueAmount.value alpha:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshButton:(id)sender {
    self.redAmount.value = 0.5;
    [self refresh];
}
- (IBAction)invertColor:(id)sender {
    float newRed = 1-self.redAmount.value;
    float newBlue = 1-self.blueAmount.value;
    float newGreen = 1-self.greenAmount.value;
    self.colorDisplay.backgroundColor  = [self invertedColor:newRed];
}

-(UIColor*) invertedColor:(float)red{
    return [UIColor colorWithRed:red green:self.greenAmount.value blue:self.blueAmount.value alpha:1.0f];
}
- (IBAction)randomColor:(id)sender {
    self.redAmount.value = [self randomGen];
    self.blueAmount.value = [self randomGen];
    self.greenAmount.value = [self randomGen];
    [self refresh];
}

-(float)randomGen {
    return (float)arc4random_uniform(10)/10;
}

@end

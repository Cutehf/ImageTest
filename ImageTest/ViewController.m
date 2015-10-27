//
//  ViewController.m
//  ImageTest
//
//  Created by 瓜木 on 15/10/27.
//  Copyright © 2015年 黄飞. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)btn:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    self.navigationController.navigationBarHidden=YES;
    
}


-(void)rr
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn:(id)sender {
    
//    UIImage *image =[UIImage streImageNamed:@"1_spec"];
    UIImage *image=  [[[UIImageTransformation alloc]init] imageByScalingAndCroppingForSize:CGSizeMake(30, 56) image:[UIImage imageNamed:@"3_spec"]];
//    image=[UIImage imageWithColor:[UIColor blueColor] size:CGSizeMake(30, 100)];
// image=   [image imageByScalingToSize:CGSizeMake(self.imageView.frame.size.width/4, self.imageView.frame.size.height/4) ];
    self.imageView.image=image;
}
@end

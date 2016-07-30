//
//  ViewController.m
//  barier
//
//  Created by shihua on 16/7/30.
//  Copyright © 2016年 shihua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray* arrayM;
@property (nonatomic, strong) dispatch_queue_t queue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数组与队列
    self.arrayM = [NSMutableArray array];
    self.queue = dispatch_queue_create("que" , DISPATCH_QUEUE_CONCURRENT);
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self loadImage];
}
- (void)loadImage {
    //往线程里添加图片
    for (int i = 0; i<20; i++) {
        dispatch_async(self.queue, ^{
            NSString *name = [NSString stringWithFormat:@"%02d.jpg",i%10+1];
        });
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

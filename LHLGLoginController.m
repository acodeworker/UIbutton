//
//  ViewController.m
//  LoginDemo
//
//  Created by jeremy on 2022/9/15.
//  Copyright © 2022 aqara. All rights reserved.
//

#import "LHLGLoginController.h"
#import <Masonry/Masonry.h>
#import "LMAppStoreRateView.h"
#import "LMAlertManager.h"
#import "LMDNSManager.h"
#import "BigInt.h"
#import <NetworkExtension/NetworkExtension.h>
#import <CoreLocation/CoreLocation.h>
#import <Matter/Matter.h>
#import <Accelerate/Accelerate.h>
#import "UIButton+ImageTitleCentering.h"
#import "loginDemo-Swift.h"

@interface LHLGLoginController ()<CAAnimationDelegate,CALayerDelegate,CLLocationManagerDelegate>
 
@end

@implementation LHLGLoginController

 
- (void)viewWillAppear:(BOOL)animated{
  [super viewWillAppear:animated];
 }

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // Do any additional setup after loading the view.
  self.view.backgroundColor = [UIColor whiteColor];
   
  UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
  btn.layer.borderWidth = 1;
  btn.layer.borderColor = UIColor.blueColor.CGColor;
  btn.titleLabel.numberOfLines = 2;
  [btn setTitle:@"click me quickly" forState:UIControlStateNormal];
  [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
  [btn setImage:[UIImage imageNamed:@"Oval_0"] forState:UIControlStateNormal];
//  [btn alignHorizontalWithSpacing:10 imageFirst:NO padding:10];
  [btn alignVerticalWithSpacing:10 imageTop:NO];
  [self.view addSubview:btn];
  [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.mas_equalTo(self.view);
    make.centerY.mas_equalTo(self.view);
  }];
}
 

- (void)btnAction:(UIButton*)btn{
  NSLog(@"点到了---------");
}


- (void)currentWiFiName:(void (^)(NSString* wifiName))handle {
  if (@available(iOS 14.0, *)) {
    [NEHotspotNetwork fetchCurrentWithCompletionHandler:^(NEHotspotNetwork * _Nullable currentNetwork) {
      if(handle){
        handle(currentNetwork.SSID);
      }
    }];
  } else {
    // Fallback on earlier versions
  }
}

 
@end

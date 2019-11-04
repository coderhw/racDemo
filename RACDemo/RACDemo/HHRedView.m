//
//  HHRedView.m
//  RACNetwork
//
//  Created by vanke on 2019/10/17.
//  Copyright © 2019 com. All rights reserved.
//

#import "HHRedView.h"

@implementation HHRedView


- (IBAction)btnClick:(id)sender {
  
    //NSLog(@"红色view监听到按钮点击");
    //通知控制器处理
    [self.btnClickSignal sendNext:@"按钮被点击"];
    
    

}


- (RACSubject *)btnClickSignal {
    if(_btnClickSignal == nil){
        _btnClickSignal = [RACSubject subject];
    }
    return _btnClickSignal;
}

@end

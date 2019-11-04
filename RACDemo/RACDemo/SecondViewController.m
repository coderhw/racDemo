//
//  SecondViewController.m
//  RACNetwork
//
//  Created by vanke on 2019/11/4.
//  Copyright © 2019 com. All rights reserved.
//

#import "SecondViewController.h"
#import <ReactiveObjC.h>
#import "RACReturnSignal.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UITextField *filterTextFiled;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
#pragma mark - 聚合
    //组合哪些信号
    //reduce:聚合
//    RACSignal *combineSignal = [RACSignal combineLatest:@[_accountField.rac_textSignal, _passwordField.rac_textSignal]
//                                                 reduce:^id (NSString *account, NSString *password){
//                                                     //聚合的值就是组合信号的内容
//                                                     //block:只要源信号发送内容就会被调用
//                                                     NSLog(@"account:%@", account);
//                                                     NSLog(@"password:%@", password);
//                                                     return @(account.length && password.length);
//    }];
//
//    [combineSignal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@", x);
//    }];
//
//    RAC(_submitButton, enabled) = combineSignal;


#pragma mark - 过滤
//    [[_filterTextFiled.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
//
//        //value:源信号的内容
//        return [value length] > 5;
//        //返回值只有满足到这个条件才会获取到内容
//    }] subscribeNext:^(NSString * _Nullable x) {
//        NSLog(@"x:%@", x);
//    }];
    
#pragma mark - 忽略
    
//    RACSubject *subject = [RACSubject subject];
//    //忽略
//    [[subject ignore:@"1"] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@", x);
//    }];
//
//    [subject sendNext:@"1"];
//    [subject sendNext:@"2"];
    

#pragma mark - 忽略前几次信号/跳跃几个信号，不接收
//    RACSubject *subject = [RACSubject subject];
//    //忽略
//    [[subject skip:1] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@", x);
//    }];
//
//    [subject sendNext:@"2"];
//    [subject sendNext:@"3"];
    
   
#pragma mark - 取前几次信号

    //take:取前面N个值
    //前2两个信号
//    RACSubject *subject = [RACSubject subject];
//    [[subject take:2] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@", x);
//
//    }];
//    [subject sendNext:@"2"];
//    [subject sendNext:@"3"];
    
    
#pragma mark - 取最后多少个值
    //取最后多少个值
    //takeLast:必须条用sendCompleted
//    RACSubject *subject = [RACSubject subject];
//    [[subject takeLast:1] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@", x);
//
//    }];
//    [subject sendNext:@"2"];
//    [subject sendNext:@"3"];
//    [subject sendCompleted];
    
    
//    //takeUntil:只要传入信号发送完成或者发送任意数据，就不会在接收源信号内容
//    RACSubject *subject = [RACSubject subject];
//    RACSubject *untilSignal = [RACSubject subject];
//    [[subject takeUntil:untilSignal] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@", x);
//    }];
//
//    [subject sendNext:@"1"];
//
//    [untilSignal sendNext:@"stop"];
// //    [untilSignal sendCompleted];
//
//    [subject sendNext:@"2"];
//    [subject sendNext:@"3"];
    


#pragma mark - distincUntilChanged
    //distincUntilChanged:当上一次值和当前的值有明显的变化就会发出信号，否则会被忽略掉
    //在开发中，刷新UI经常使用，只有两次数据不一样的时候才需要刷新
    [[_filterTextFiled.rac_textSignal distinctUntilChanged] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"x:%@", x);
    }];
}

- (IBAction)submitButtonPressed:(id)sender {
    
}



@end
